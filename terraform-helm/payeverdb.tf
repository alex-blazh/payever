# === MariaDB ===
# resource "kubernetes_config_map" "initdb" {
#   metadata {
#     name = "initdb"
#   }
#   data = {
#     "init.sql" = "${file("${path.module}/mariadb/init.sql")}"
#   }
# }

resource "helm_release" "payeverdb" {
  name  = "payeverdb"
  repository = "bitnami"
  chart      = "bitnami/mariadb"
  version    = "7.9.0"
  values = [
    "${file("${path.module}/payeverdb-values.yml")}"
  ]
  # provisioner "local-exec" {
  #   command = "helm test payeverdb"
  # }
  # depends_on = [
  #   kubernetes_config_map.initdb,
  # ]
}