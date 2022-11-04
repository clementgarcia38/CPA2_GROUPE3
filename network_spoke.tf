resource "azurerm_virtual_network" "network_spoke" {
  name                = "vnetspoke${local.location}"
  location            = local.location
  resource_group_name = azurerm_resource_group.rg_network.name
  address_space       = ["10.2.0.0/16"]
  #  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  tags = {
    env   = "prod"
    scope = "client"
  }
}

resource "azurerm_subnet" "sub_bdd" {
  name                 = "subbdd"
  resource_group_name  = azurerm_resource_group.rg_network.name
  virtual_network_name = azurerm_virtual_network.network_spoke.name
  address_prefixes     = ["10.2.2.0/24"]
}

resource "azurerm_subnet" "sub_aks" {
  name                 = "subaks"
  resource_group_name  = azurerm_resource_group.rg_network.name
  virtual_network_name = azurerm_virtual_network.network_spoke.name
  address_prefixes     = ["10.2.1.0/24"]
}