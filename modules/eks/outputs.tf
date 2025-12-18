output "cluster_name" {
  description = "EKS cluster name"
  value       = aws_eks_cluster.eks.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.eks.endpoint
}

output "cluster_arn" {
  value = aws_eks_cluster.eks.arn
}

output "cluster_certificate_authority" {
  value = aws_eks_cluster.eks.certificate_authority[0].data
}

output "oidc_provider_arn" {
  value = aws_iam_openid_connect_provider.oidc.arn
}

output "oidc_provider_url" {
  value = aws_iam_openid_connect_provider.oidc.url
}
