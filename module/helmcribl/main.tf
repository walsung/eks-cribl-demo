resource "kubernetes_storage_class" "ebs-sc" {
  metadata {
    name = "ebs-sc"
  }

  storage_provisioner = "kubernetes.io/aws-ebs"

  parameters = {
    type = "gp2"
  }

  reclaim_policy = "Retain"
  volume_binding_mode = "WaitForFirstConsumer"
}

resource "kubernetes_namespace" "app_namespace" {
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
  create_namespace = true
  timeout = 1200
  cleanup_on_fail = true

  lifecycle {
    create_before_destroy = false
  }

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

  set {
    name  = "config.adminPassword"
    value = "criblleader"
  }
  

  
  # depends_on = [kubernetes_namespace.app_namespace]

}