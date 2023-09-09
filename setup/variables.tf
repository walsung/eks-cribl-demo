variable "region" {
  description = "Define AWS region"
  type = string
  default = "us-east-1"
}

variable "bucketname" {
    description = "S3 bucket prefix name"
    type = string
    default = "billy"
}