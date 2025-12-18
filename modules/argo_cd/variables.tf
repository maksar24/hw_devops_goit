variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "namespace" {
  type        = string
  default     = "argocd"
  description = "Namespace для Argo CD"
}

variable "chart_version" {
  type        = string
  default     = "5.41.1"
  description = "Версія Helm чарта Argo CD"
}

variable "repo_url" {
  type        = string
  description = "Git репозиторій з Helm chart для додатків"
}

variable "oidc_provider_arn" {
  type        = string
}

variable "oidc_provider_url" {
  type        = string
}
