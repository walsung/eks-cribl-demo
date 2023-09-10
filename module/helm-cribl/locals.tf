locals {
    eks_cluster_endpoint = var.eks_cluster_endpoint
    eks_certificate_authority_data = var.eks_certificate_authority_data
    eks_cluster_name = var.eks_cluster_name
    # kube_config = var.kube_config
    chart      = var.chart
    chartname   = var.chartname
    namespace  = var.namespace
    chartversion    = var.chartversion
    repository = var.repository
    config_token = var.config_token
}