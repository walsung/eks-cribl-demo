locals {
  account_id            = "319211394597"
  name = "billy"
  region             = "us-east-1"
  availability_zones = ["${local.region}a", "${local.region}b", "${local.region}c"]
  tags               = {
    "Environment" : "PROD"
    "Project" : "Infrastructure"
  }
}