resource "azurerm_resource_group" "rg_spoke" {
  name     = "rgspoke${local.location}"
  location = local.location
  # location = "West Europe"

  tags = {
    env   = "prod"
    scope = "client"
  }
}