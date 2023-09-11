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

    # host = "https://05EBF554F47AFEB453641AE8339CA6BE.gr7.us-east-1.eks.amazonaws.com"
    # cluster_ca_certificate = base64decode("LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURCVENDQWUyZ0F3SUJBZ0lJV3o4aFB3R1AxcEl3RFFZSktvWklodmNOQVFFTEJRQXdGVEVUTUJFR0ExVUUKQXhNS2EzVmlaWEp1WlhSbGN6QWVGdzB5TXpBNU1URXdNakkxTVRSYUZ3MHpNekE1TURnd01qSTFNVFJhTUJVeApFekFSQmdOVkJBTVRDbXQxWW1WeWJtVjBaWE13Z2dFaU1BMEdDU3FHU0liM0RRRUJBUVVBQTRJQkR3QXdnZ0VLCkFvSUJBUURocDF6OUdlWjlqcGM0N3JqV25DdE1CaXlOSkJWR2pOcEExekx6ODhRMXZJSjFiVDZ2Uk05SVBkbUEKNHZsUk5qbEdQSDFMYmk1a0pUaWNBN3ZZd1VmWDVLSkpYQjBKdVU3VzI2L0ZFZkZGdGZYL1pGTUFqSi84Z1RMZQpzSjBpTU1rTmNBa2J0Zm5sZUR4Q0dnSm5UVWVhQnBpcTNzejVSY1BKeUsyNGJBamtuZit6RmtHY052ZkJ6OGJUCnJrU2N0aTdacDl1VmVzOFc3THBHaVpOeWN0WE8xNFdhR0Vsb21aQ3JnNWR1aUY4VVkwV0J2a3h5cWtSOGdHS1cKVllOWW5mZDRhemdVaERNNUFDMHZpZDFiLzk3cmx5ZWlEaFdnMTIyWnpPTUd4Q1FRTDYrZUZVdTlIVk10alI0Uwo0ME9zZ2w4NEoxcEpMb0pUZERkbUM0N1FFVUo1QWdNQkFBR2pXVEJYTUE0R0ExVWREd0VCL3dRRUF3SUNwREFQCkJnTlZIUk1CQWY4RUJUQURBUUgvTUIwR0ExVWREZ1FXQkJUWDM1NjVHV3JkR3VIVGtYc1dIbGJoeUZzUkp6QVYKQmdOVkhSRUVEakFNZ2dwcmRXSmxjbTVsZEdWek1BMEdDU3FHU0liM0RRRUJDd1VBQTRJQkFRQmdpdG1GWk1NZApNYjFMaVhGcXhGdVJsS21tWHVHUHZBaHBMRXFldDlJSVNyckIzVlJEM1VYM2xpNWZ3Q1pUNGd0YlNkUTlzOENTCkdDbDNyV2xnMzRXbmY2NVBWeWllc3V5K0hXbWpsR0E2RWkxZFBrZzkrcS9CUWZpdHBnb2dDVTg1TWVCQmZseEYKYWxnbXNIYmJacTlKc1FEU2xnYzZyVmYxZVJvWC9qSEdCbHNWNTd0VUxsekhLYTZDbThMMGJ2Z2hoOHpWUWx2bwpVZTJpaUhOZi91L2dxdHlPT29IQ1l5Q211MzRyTUp1QzlOeUFnS2VSTHBac0E1VUVuTDZXRytsTk1CZ1BBU0JRCnhpUWV3OHVJS285OHlRbnQ4eUl3RVRid3BuOGFGZFZhRnd6NzZwUkhwMVp2YUpWcVhXSE5zRGlCbk1ZcWRlMUYKdVl6R2VOT3daRHh6Ci0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K")
    # exec {
    #   api_version = "client.authentication.k8s.io/v1beta1"
    #   args        = ["eks", "get-token", "--cluster-name", "billy-eks"]
    #   command     = "aws"
    # }
  }
}

provider "kubernetes" {
  # config_path = pathexpand(local.kube_config)
  # host = "https://05EBF554F47AFEB453641AE8339CA6BE.gr7.us-east-1.eks.amazonaws.com"
  # cluster_ca_certificate = base64decode("LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSURCVENDQWUyZ0F3SUJBZ0lJV3o4aFB3R1AxcEl3RFFZSktvWklodmNOQVFFTEJRQXdGVEVUTUJFR0ExVUUKQXhNS2EzVmlaWEp1WlhSbGN6QWVGdzB5TXpBNU1URXdNakkxTVRSYUZ3MHpNekE1TURnd01qSTFNVFJhTUJVeApFekFSQmdOVkJBTVRDbXQxWW1WeWJtVjBaWE13Z2dFaU1BMEdDU3FHU0liM0RRRUJBUVVBQTRJQkR3QXdnZ0VLCkFvSUJBUURocDF6OUdlWjlqcGM0N3JqV25DdE1CaXlOSkJWR2pOcEExekx6ODhRMXZJSjFiVDZ2Uk05SVBkbUEKNHZsUk5qbEdQSDFMYmk1a0pUaWNBN3ZZd1VmWDVLSkpYQjBKdVU3VzI2L0ZFZkZGdGZYL1pGTUFqSi84Z1RMZQpzSjBpTU1rTmNBa2J0Zm5sZUR4Q0dnSm5UVWVhQnBpcTNzejVSY1BKeUsyNGJBamtuZit6RmtHY052ZkJ6OGJUCnJrU2N0aTdacDl1VmVzOFc3THBHaVpOeWN0WE8xNFdhR0Vsb21aQ3JnNWR1aUY4VVkwV0J2a3h5cWtSOGdHS1cKVllOWW5mZDRhemdVaERNNUFDMHZpZDFiLzk3cmx5ZWlEaFdnMTIyWnpPTUd4Q1FRTDYrZUZVdTlIVk10alI0Uwo0ME9zZ2w4NEoxcEpMb0pUZERkbUM0N1FFVUo1QWdNQkFBR2pXVEJYTUE0R0ExVWREd0VCL3dRRUF3SUNwREFQCkJnTlZIUk1CQWY4RUJUQURBUUgvTUIwR0ExVWREZ1FXQkJUWDM1NjVHV3JkR3VIVGtYc1dIbGJoeUZzUkp6QVYKQmdOVkhSRUVEakFNZ2dwcmRXSmxjbTVsZEdWek1BMEdDU3FHU0liM0RRRUJDd1VBQTRJQkFRQmdpdG1GWk1NZApNYjFMaVhGcXhGdVJsS21tWHVHUHZBaHBMRXFldDlJSVNyckIzVlJEM1VYM2xpNWZ3Q1pUNGd0YlNkUTlzOENTCkdDbDNyV2xnMzRXbmY2NVBWeWllc3V5K0hXbWpsR0E2RWkxZFBrZzkrcS9CUWZpdHBnb2dDVTg1TWVCQmZseEYKYWxnbXNIYmJacTlKc1FEU2xnYzZyVmYxZVJvWC9qSEdCbHNWNTd0VUxsekhLYTZDbThMMGJ2Z2hoOHpWUWx2bwpVZTJpaUhOZi91L2dxdHlPT29IQ1l5Q211MzRyTUp1QzlOeUFnS2VSTHBac0E1VUVuTDZXRytsTk1CZ1BBU0JRCnhpUWV3OHVJS285OHlRbnQ4eUl3RVRid3BuOGFGZFZhRnd6NzZwUkhwMVp2YUpWcVhXSE5zRGlCbk1ZcWRlMUYKdVl6R2VOT3daRHh6Ci0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K")
  # exec {
  #   api_version = "client.authentication.k8s.io/v1beta1"
  #   args        = ["eks", "get-token", "--cluster-name", "billy-eks"]
  #   command     = "aws"
  # }
  host                   = local.eks_cluster_endpoint
  cluster_ca_certificate = base64decode(local.eks_certificate_authority_data)
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    args        = ["eks", "get-token", "--cluster-name", local.eks_cluster_name]
    command     = "aws"
  }
}