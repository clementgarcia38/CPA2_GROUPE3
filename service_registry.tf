resource "azurerm_container_registry" "container_registry" {
  name                = "containerRegistry1"
  resource_group_name = azurerm_resource_group.rg_registry.name
  location            = local.location
  sku                 = "Standard"
  admin_enabled       = false
}