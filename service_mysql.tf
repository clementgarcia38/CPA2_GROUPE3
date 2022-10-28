resource "azurerm_mysql_flexible_server" "mysql" {
  name                   = "mysqlcpa2"
  location               = azurerm_resource_group.rg_mysql.location
  resource_group_name    = azurerm_resource_group.rg_mysql.name
  administrator_login    = "psqladmin"
  administrator_password = "H@Sh1CoR3!"
  backup_retention_days  = 7
  delegated_subnet_id    = azurerm_subnet.mysql_vnet.id
#  private_dns_zone_id    = azurerm_private_dns_zone.example.id
  sku_name               = "Standard_B1ms"

 # depends_on = [azurerm_private_dns_zone_virtual_network_link.example]
}