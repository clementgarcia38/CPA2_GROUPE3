resource "azurerm_network_security_group" "nsg_aks" {
  name                = "nsgaks"
  location            = local.location
  resource_group_name = azurerm_resource_group.rg_network.name

  security_rule {
    name                       = "bddtoaks"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "10.2.2.0/24"
    destination_address_prefix = "10.2.1.0/24"
  }
  security_rule {
    name                       = "hubtoaks"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "10.1.0.0/16" # Juste pour test, à changer ! 
    destination_address_prefix = "10.2.1.0/24"
  }
}

resource "azurerm_subnet_network_security_group_association" "nsg_aks_link" {
  subnet_id                 = azurerm_subnet.sub_aks.id
  network_security_group_id = azurerm_network_security_group.nsg_aks.id
}