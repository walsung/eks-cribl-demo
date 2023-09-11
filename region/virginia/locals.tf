locals {
  account_id         = "319211394597"
  name               = "billy-eks"
  region             = "us-east-1"
  availability_zones = ["${local.region}a", "${local.region}b", "${local.region}c"]

  ## module jumphost
  # instance_type = "t2.micro"
  # instance_ami  = "ami-01c647eace872fc02"
  # shared_tags = {
  #   "Name" : "billy-eks"
  # }

  ## module eks
  eks_version       = "1.27"
  desired_size      = 2
  max_size          = 2
  min_size          = 2
  ec2_instance_type = "m5a.4xlarge"    # normal t3.micro, but for cribl, needs big CPU/RAM
  #tags               = local.eks_tags

  ## module helm cribl
  chart        = "logstream-leader"             ## actually in helm repo it's cribl/logstream-leader, in terraform, need to chop off the cribl/
  chartname    = "logstream-leader"
  namespace    = "cribl-dev"
  chartversion = "4.2.2"
  repository   = "https://criblio.github.io/helm-charts"
  config_token = "ABCDEF01-1234-5678-ABCD-ABCDEF012345"

  tags = {
    "Environment" : "Development"
    "Project" : "Infrastructure"
  }

}