provider "helm" {
  version = "~> 1.2"
#   install_tiller = true
}

provider "kubernetes" {
  version = "~> 1.12"
}

data "helm_repository" "stable" {
  name = "stable"
  url  = "https://kubernetes-charts.storage.googleapis.com/"
}

data "helm_repository" "bitnami" {
  name = "bitnami"
  url  = "https://charts.bitnami.com/bitnami"
}

data "helm_repository" "influxdata" {
  name = "influxdata"
  url  = "https://helm.influxdata.com/"
}
