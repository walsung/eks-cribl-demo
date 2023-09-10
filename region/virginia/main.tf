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
module "ECS" {
  source                 = "../../module/ecs"
  vpc_id                 = module.Networking.vpc_id
  account_id             = local.account_id
  ecs_cluster_name       = "ecs-cluster"
  ecs_service_name       = "golang-web-service"
  cpu                    = 256
  memory                 = 512
  max_capacity           = 8
  project_name           = "golang-web"
  image_name             = "golang-web"
  region                 = local.region
  vpc_private_subnets_id = module.Networking.private_subnets_id
  vpc_public_subnets_id  = module.Networking.public_subnets_id
}


module "jumpserver" {
  source             = "../../module/jumpserver"
  vpc_id             = module.Networking.vpc_id
  instance_type      = local.instance_type
  instance_ami       = local.instance_ami
  subnet_id          = module.Networking.public_subnets_id[0][0]
  security_group_ids = module.Networking.security_group_ids
  #tags               = local.shared_tags
}



module "eks"  {
  source                 = "../../module/eks"
  name               = local.name
  vpc_id             = module.Networking.vpc_id
  public_subnets_id  = module.Networking.public_subnets_id
  private_subnets_id = module.Networking.private_subnets_id
  eks_version        = local.eks_version
  desired_size       = local.desired_size
  max_size           = local.max_size
  min_size           = local.min_size
  security_group_ids = module.Networking.security_group_ids
 # tags               = local.eks_tags
}






# Create pipeline
# module "Pipeline" {
#   source           = "../../module/pipeline"
#   name             = "golang-web-${local.name}"
#   image_name       = "golang-web"
#   account_id       = local.account_id
#   region           = local.region
#   pipeline_tags    = local.tags
#   ecs_cluster_name = module.ECS.ecs_cluster_name
#   ecs_service_name = module.ECS.ecs_service_name
# }
