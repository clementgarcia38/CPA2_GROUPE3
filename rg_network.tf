resource "azurerm_resource_group" "rg_network" {
  name     = "rgnetwork"
  location = local.location

  tags = {
    env   = "prod"
    scope = "client"
  }
}