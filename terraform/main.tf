terraform {
    required_providers {
        k3d = {
            source = "pvotal-tech/k3d"
            version = "0.0.7"
        }
    }
}
provider "k3d" { }

resource "k3d_cluster" "cluster" {
  name    = "playground"
  servers = 1

  kube_api {
    host      = "127.0.0.1"
    host_ip   = "127.0.0.1"
    host_port = 6443
  }

  image   = "rancher/k3s:v1.20.4-k3s1"

  kubeconfig {
    update_default_kubeconfig = true
    switch_current_context    = true
  }

}