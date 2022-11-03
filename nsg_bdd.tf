resource "azurerm_network_security_group" "nsg_bdd" {
    name = "nsgbb"
    location = local.location
    resource_group_name = azurerm_resource_group.rg_network.name

    security_rule {
        name                       = "akstobdd"
        priority                   = 100
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "3306"
        source_address_prefix      = "10.2.1.0/24"
        destination_address_prefix = "10.2.2.0/24"
  }
} 

resource "azurerm_subnet_network_security_group_association" "nsg_bdd_link" {
  subnet_id                 = azurerm_subnet.sub_bdd.id
  network_security_group_id = azurerm_network_security_group.nsg_bdd.id
}