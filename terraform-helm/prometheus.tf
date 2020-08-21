# === Prometheus ===
resource "helm_release" "prometheus" {
  name  = "prometheus"
  chart      = "stable/prometheus"
  version    = "11.12.0"
}