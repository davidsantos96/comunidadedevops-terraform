output "oidc" {
  value = aws_eks_cluster.eks_cluster.identity
}

output "cluster_name" {
  value = aws_eks_cluster.eks_cluster.name
  
}