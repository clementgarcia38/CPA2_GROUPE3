resource "azurerm_virtual_network" "network_spoke" {
  name                = "vnetspoke${local.location}"
  location            = local.location
  resource_group_name = azurerm_resource_group.rg_spoke.name
  address_space       = ["10.2.0.0/16"]
  #  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "subaks"
    address_prefix = "10.2.1.0/27"
  }

  subnet {
    name           = "subbdd"
    address_prefix = "10.2.2.0/27"
    #    security_group = azurerm_network_security_group.example.id
  }

  tags = {
  }
}