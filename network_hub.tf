resource "azurerm_virtual_network" "network_hub" {
  name                = "vnethub"
  location            = local.location
  resource_group_name = azurerm_resource_group.rg_hub.name
  address_space       = ["10.1.0.0/16"]
  #  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subbastion"
    address_prefix = "10.1.1.0/26"
  }

  subnet {
    name           = "subvmcontroller"
    address_prefix = "10.1.2.0/26"
    #    security_group = azurerm_network_security_group.example.id
  }

  tags = {
    env = "prod"
    scope = "admin"
  }
}