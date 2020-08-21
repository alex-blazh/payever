# # === Telegraf ===
resource "helm_release" "telegraf" {
  name  = "telegraf"
  repository = "influxdata"
  chart      = "influxdata/telegraf"
  version    = "1.7.21"
  values = [
    "${file("${path.module}/telegraf-values.yml")}"
  ]
  # provisioner "local-exec" {
  #   command = "helm test telegraf"
  # }
}