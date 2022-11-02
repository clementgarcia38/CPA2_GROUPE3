resource "azurerm_resource_group" "rg_hub" {
  name     = "rghub${local.location}"
  location = local.location
}