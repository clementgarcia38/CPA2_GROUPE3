resource "azurerm_virtual_network" "network_hub" {
  name                = "vnethub"
  location            = local.location
  resource_group_name = azurerm_resource_group.rg_network.name
  address_space       = ["10.1.0.0/16"]
  #  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  tags = {
    env = "prod"
    scope = "admin"
  }
}
  resource "azurerm_subnet" "sub_vmcontroller" {
    name           = "subvmcontroller"
    resource_group_name  = azurerm_resource_group.rg_network.name
    virtual_network_name = azurerm_virtual_network.network_hub.name
    address_prefixes     = ["10.1.2.0/27"]
  }