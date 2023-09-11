

resource "kubernetes_namespace" "app-namespace" {
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

  ## cribl logstream-leader
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

  ## redis
  #   set {
  #   name  = "cluster.enabled"
  #   value = "true"
  # }

  # set {
  #   name  = "metrics.enabled"
  #   value = "true"
  # }

  # set {
  #   name  = "service.annotations.prometheus\\.io/port"
  #   value = "9127"
  #   type  = "string"
  # }

  depends_on = [kubernetes_namespace.app-namespace]
}