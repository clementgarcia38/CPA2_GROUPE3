resource "azurerm_resource_group" "rg_hub" {
  name     = "rghub"
  location = local.location
}