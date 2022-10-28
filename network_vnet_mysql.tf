resource "azurerm_virtual_network" "mysql_vnet" {
  name                = "mysqlvnet"
  location            = azurerm_resource_group.rg_mysql.location
  resource_group_name = azurerm_resource_group.rg_mysql.name
  address_space       = ["10.10.0.0/16"]
 # dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "principal_subnet"
    address_prefix = "10.10.1.0/24"
  }

}