resource "azurerm_resource_group" "rg_registry" {
  name     = "rgregistry"
  location = local.location
  
  tags = {
    env = "prod"
    scope = "admin"
  }
}