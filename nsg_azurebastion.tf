resource "azurerm_network_security_group" "nsg_azurebastion" {
    name = "nsgazurebastion"
    location = local.location
    resource_group_name = azurerm_resource_group.rg_network.name
  }

resource "azurerm_subnet_network_security_group_association" "nsg_azurebastion_link" {
  subnet_id                 = azurerm_subnet.sub_bastion.id
  network_security_group_id = azurerm_network_security_group.nsg_azurebastion.id
}