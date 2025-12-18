data "kubernetes_service_v1" "argocd_server" {
  metadata {
    name      = "argocd-server"
    namespace = "argocd"
  }
}

output "argocd_server_url" {
  description = "Argo CD server LoadBalancer hostname"
  value       = try(data.kubernetes_service_v1.argocd_server.status[0].load_balancer[0].ingress[0].hostname, "not ready yet")
}

data "kubernetes_secret_v1" "argocd_admin" {
  metadata {
    name      = "argocd-initial-admin-secret"
    namespace = "argocd"
  }
}

output "argocd_initial_password" {
  description = "Initial admin password for Argo CD"
  value       = try(base64decode(data.kubernetes_secret_v1.argocd_admin.data["password"]), "not ready yet")
}