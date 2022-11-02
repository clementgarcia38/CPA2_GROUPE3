resource "azurerm_resource_group" "rg_spoke" {
  name     = "rgspoke1"
  location = local.location
 # location = "West Europe"
}