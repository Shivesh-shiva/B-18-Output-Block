resource "azurerm_kubernetes_cluster" "aks" {
  for_each = var.aks
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.rg_name
  dns_prefix          = each.value.dns_prefix

  default_node_pool {
    name       = each.value.default_node_pool_name
    node_count = each.value.node_count #1
    vm_size    = each.value.vm_size #"Standard_A2_v2"
  }

node_provisioning_profile{
  default_node_pools = each.value.default_node_pools #"None"
}
  
  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Production"
  }
}


resource "azurerm_role_assignment" "role" {
  for_each = var.aks
  scope                = var.acr_id[each.value.existing_acr_key]
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks[each.key].kubelet_identity[0].object_id
}

