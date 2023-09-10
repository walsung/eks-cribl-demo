output "endpoint" {
  value = aws_eks_cluster.eks.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.eks.certificate_authority[0].data
}

output "cluster_id" {
  value = aws_eks_cluster.cluster_id
}

output "cluster-endpoint" {
  value = aws_eks_cluster.cluster.endpoint
}