output "acr_id" {
  value = {for k, v in azurerm_container_registry.acr : k => v.id }
}

