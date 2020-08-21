# === Grafana ===
resource "kubernetes_config_map" "grafana-dashboards" {
  metadata {
    name = "grafana-dashboards"
  }
  data = {
    "dashboards.yml"             = "${file("${path.module}/grafana/dashboards.yml")}"
    "dashboard_k8s.json"         = "${file("${path.module}/grafana/dashboard_alarms.json")}"
    "dashboard_k8s_cluster.json" = "${file("${path.module}/grafana/dashboard_k8s_cluster.json")}"
    "dashboard_prometheus.json"  = "${file("${path.module}/grafana/dashboard_prometheus.json")}"
    "dashboard_system.json"      = "${file("${path.module}/grafana/dashboard_system.json")}"
  }
}
resource "kubernetes_secret" "grafana-datasources" {
  metadata {
    name = "grafana-datasources"
  }
  data = {
    "datasources.yml" = "${file("${path.module}/grafana/datasources.yml")}"
  }
}

resource "helm_release" "grfana" {
  name       = "grafana"
  repository = "bitnami"
  chart      = "bitnami/grafana"
  version    = "3.4.0"
  values = [
    "${file("${path.module}/grafana-values.yml")}"
  ]
}
