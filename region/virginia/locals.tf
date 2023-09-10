locals {
  account_id         = "319211394597"
  name               = "billy"
  region             = "us-east-1"
  availability_zones = ["${local.region}a", "${local.region}b", "${local.region}c"]

  ## module jumphost
  instance_type = "t2.micro"
  instance_ami  = "ami-01c647eace872fc02"
  shared_tags = {
    "Name" : "billy-eks"
  }

  ## module eks
  eks_version       = "1.27"
  desired_size      = 2
  max_size          = 3
  min_size          = 2
  ec2_instance_type = "t3a.xlarge"
  #tags               = local.eks_tags

  ## module helm cribl
  chart        = "cribl/logstream-leader"
  chartname    = "logstream-leader"
  namespace    = "cribl-dev"
  chartversion = "4.2.1"
  repository   = "https://criblio.github.io/helm-charts"
  config_token = "ABCDEF01-1234-5678-ABCD-ABCDEF012345"

  tags = {
    "Environment" : "Development"
    "Project" : "Infrastructure"
  }

}