provider "aws" {
  region = local.region
}

module "Networking" {
  source                     = "../../module/networking"
  name                       = "VPC"
  availability_zones         = local.availability_zones
  vpc_cidr_block             = "10.0.0.0/16"
  public_subnets_cidr_block  = ["10.0.32.0/24", "10.0.96.0/24", "10.0.224.0/24"]
  private_subnets_cidr_block = ["10.0.0.0/19", "10.0.64.0/19", "10.0.128.0/19"]
  vpc_tags                   = local.tags
}

# Create ECS for demo
# module "ECS" {
#   source                 = "../../module/ecs"
#   vpc_id                 = module.Networking.vpc_id
#   account_id             = local.account_id
#   ecs_cluster_name       = "ecs-cluster"
#   ecs_service_name       = "billy-test-cribl"
#   cpu                    = 256
#   memory                 = 512
#   max_capacity           = 8
#   project_name           = "billy-test-cribl"
#   image_name             = "billy-test-cribl"
#   region                 = local.region
#   vpc_private_subnets_id = module.Networking.private_subnets_id
#   vpc_public_subnets_id  = module.Networking.public_subnets_id
# }


module "EKS" {
  source             = "../../module/eks"
  name               = local.name
  vpc_id             = module.Networking.vpc_id
  public_subnets_id  = module.Networking.public_subnets_id
  private_subnets_id = module.Networking.private_subnets_id
  eks_version        = local.eks_version
  desired_size       = local.desired_size
  max_size           = local.max_size
  min_size           = local.min_size
  security_group_ids = module.Networking.security_group_ids
  ec2_instance_type  = local.ec2_instance_type
  # tags               = local.eks_tags
  depends_on = [module.Networking]
}


module "helmcribl" {
  source                         = "../../module/helmcribl"
  eks_cluster_endpoint           = module.EKS.endpoint
  eks_certificate_authority_data = module.EKS.kubeconfig-certificate-authority-data
  eks_cluster_name               = module.EKS.cluster_name
  chart                          = local.chart
  chartname                      = local.chartname
  namespace                      = local.namespace
  chartversion                   = local.chartversion
  repository                     = local.repository
  config_token                   = local.config_token
  depends_on = [module.EKS]
}

# module "jumpserver" {
#   source        = "../../module/jumpserver"
#   vpc_id        = module.Networking.vpc_id
#   instance_type = local.instance_type
#   instance_ami  = local.instance_ami
#   # public_subnets_id  = keys(module.Networking.public_subnets_id)
#   public_subnets_id  = module.Networking.public_subnets_id
#   security_group_ids = module.Networking.security_group_ids
#   #tags               = local.shared_tags
#   depends_on = [module.Networking]
# }




