variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "oidc_provider_arn" {
  description = "ARN OIDC provider для IRSA"
  type        = string
}

variable "oidc_provider_url" {
  description = "URL OIDC provider для IRSA"
  type        = string
}

variable "jenkins_admin_user" {
  description = "Ім'я адміністратора Jenkins"
  type        = string
  default     = "admin"
}

variable "jenkins_admin_password" {
  description = "Пароль адміністратора Jenkins"
  type        = string
  default     = "admin123"
}
