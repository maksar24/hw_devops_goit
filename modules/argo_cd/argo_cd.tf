resource "helm_release" "argo_apps" {
  depends_on = [kubernetes_namespace_v1.argocd]

  name      = "argo-apps"
  namespace = kubernetes_namespace_v1.argocd.metadata[0].name
  chart     = "${path.module}/charts"
  values    = [file("${path.module}/charts/values.yaml")]
}
