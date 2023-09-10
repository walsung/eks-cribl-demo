provider "helm" {
  kubernetes {
    # config_path = pathexpand(local.kube_config)  
    host                   = local.eks_cluster_endpoint
    cluster_ca_certificate = base64decode(local.eks_certificate_authority_data)
    exec {
      api_version = "client.authentication.k8s.io/v1beta1"
      args        = ["eks", "get-token", "--cluster-name", local.eks_cluster_name]
      command     = "aws"
    }
  }
}

# provider "kubernetes" {
#   config_path = pathexpand(local.kube_config)
# }