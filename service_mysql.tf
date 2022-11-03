resource "azurerm_mysql_flexible_server" "mysql" {
  name                   = "mysql${local.location}"
  location               = local.location
  resource_group_name    = azurerm_resource_group.rg_mysql.name

  administrator_login    = "psqladmin"
  administrator_password = "H@Sh1CoR3!"
  
  backup_retention_days  = 7
  sku_name               = "B_Standard_B1ms"
  
# Je n'arrive pas a laisser sans Zone, au second apply de tf il veut obligatoirement me passer à 1 ... du coup je le set
  zone = 1 
tags = {
    env = "prod"
    scope = "client"
  }
}