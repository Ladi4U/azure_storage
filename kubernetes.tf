locals{
cluster_name= ["file1","file2"]
}
resource "azurerm_resource_group" "mcit" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_kubernetes_cluster" "kubernetestest" {
for_each= {for cluster in local.cluster_name: cluster=>cluster}  
name                = "example-aks1"
  location            = azurerm_resource_group.mcit.location
  resource_group_name = azurerm_resource_group.mcit.name
  dns_prefix          = "exampleaks1"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}

output "client_certificate" {
  value     = [for cluster in azurerm_kubernetes_cluster.kubernetestest:cluster.kube_config.0.client_certificate] 
  sensitive = true
}

output "kube_config" {
  value = [for cluster in azurerm_kubernetes_cluster.kubernetestest:cluster.kube_config_raw]

  sensitive = true
}
