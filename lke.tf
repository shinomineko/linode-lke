resource "linode_lke_cluster" "test_cluster" {
  label       = var.cluster_label
  k8s_version = var.k8s_version
  region      = var.region
  pool {
    type  = var.pool_type
    count = var.pool_count
  }
}

variable "cluster_label" {
  type    = string
  default = "lke"
}

variable "k8s_version" {
  type = string
}

variable "region" {
  type    = string
  default = "ap-south"
}

variable "pool_type" {
  type    = string
  default = "g6-standard-1"
}

variable "pool_count" {
  type    = number
  default = 1
}

output "api_endpoints" {
  value = linode_lke_cluster.test_cluster.api_endpoints
}

output "kubeconfig" {
  value = linode_lke_cluster.test_cluster.kubeconfig
}
