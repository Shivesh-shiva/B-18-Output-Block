resource "azurerm_container_registry" "acr" {
  for_each = var.acr
  name                = each.value.name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  sku                 = each.value.sku

}