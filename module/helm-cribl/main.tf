

resource "kubernetes_namespace" "cribl-dev" {
  metadata {
    name = local.namespace
  }
}

resource "helm_release" "logstream-leader" {
  chart      = local.chart
  name       = local.chartname
  repository = local.repository
  namespace  = local.namespace
  version    = local.chartversion

  set {
    name  = "config.groups"
    value = "{group1,group2}"
  }

  set {
    name  = "config.token"
    value = local.config_token
  }

  set {
    name  = "config.host"
    value = "logstream-leader-internal"
  }

}