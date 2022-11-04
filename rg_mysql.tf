resource "azurerm_resource_group" "rg_mysql" {
  name     = "rgmysql${local.location}"
  location = local.location

  tags = {
    env   = "prod"
    scope = "client"
  }
}