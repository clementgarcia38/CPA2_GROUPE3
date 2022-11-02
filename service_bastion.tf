resource "azurerm_bastion_host" "bastion_hub" {
  name                = "bastionhub"
  location            = local.location
  resource_group_name = azurerm_resource_group.rg_hub.name

  ip_configuration {
    name                 = "bastionip"
    subnet_id            = azurerm_subnet.sub_bastion.id
    public_ip_address_id = azurerm_public_ip.pip_bastion.id
  }
}

resource "azurerm_public_ip" "pip_bastion" {
  name                = "pipbastionhub"
  location            = local.location
  resource_group_name = azurerm_resource_group.rg_hub.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_subnet" "sub_bastion" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.rg_hub.name
  virtual_network_name = azurerm_virtual_network.network_hub.name
  address_prefixes     = ["10.1.1.0/27"]
}