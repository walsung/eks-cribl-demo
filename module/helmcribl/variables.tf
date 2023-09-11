# variable "kube_config" {
#   description = "Path to the kubeconfig file"
#   type        = string
# }

variable "eks_cluster_endpoint" {
  description = "Endpoint URL of the EKS cluster"
  type        = string
}

variable "eks_certificate_authority_data" {
  description = "Base64-encoded certificate authority data for the EKS cluster"
  type        = string
}

variable "eks_cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "chart" {
  description = "Helm chart name"
  type        = string
}

variable "chartname" {
  description = "Name of the chart"
  type        = string
}

variable "namespace" {
  description = "Kubernetes namespace"
  type        = string
}

variable "chartversion" {
  description = "Version of the Helm chart"
  type        = string
}

variable "repository" {
  description = "URL of the Helm chart repository"
  type        = string
}

variable "config_token" {
  description = "Configuration token that bootstraps cribl leader to cribl workers"
  type        = string
}