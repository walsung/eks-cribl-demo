locals {
  account_id            = "319211394597"
  name = "billy"
  region             = "us-east-1"
  availability_zones = ["${local.region}a", "${local.region}b", "${local.region}c"]

  ## jumphost
  instance_type      = "t2.micro"
  instance_ami       = "ami-01c647eace872fc02"
#  public_subnets_id          = module.Networking.public_subnets_id[0][0]
  # shared_tags        = {
  #   "Name" : "billy-eks"
  # }

  ## eks
  eks_version        = "1.27"
  desired_size       = 2
  max_size           = 3
  min_size           = 2
  security_group_ids = module.Networking.security_group_ids
  #tags               = local.eks_tags

  tags               = {
    "Environment" : "Development"
    "Project" : "Infrastructure"
  }

}