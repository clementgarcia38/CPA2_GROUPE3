resource "azurerm_virtual_network_peering" "peer_hubtospoke" {
  name                      = "peerhubtospoke"
  resource_group_name       = azurerm_resource_group.rg_network.name
  virtual_network_name      = azurerm_virtual_network.network_hub.name
  remote_virtual_network_id = azurerm_virtual_network.network_spoke.id
}

resource "azurerm_virtual_network_peering" "peer_spoketohub" {
  name                      = "peerspoketohub"
  resource_group_name       = azurerm_resource_group.rg_network.name
  virtual_network_name      = azurerm_virtual_network.network_spoke.name
  remote_virtual_network_id = azurerm_virtual_network.network_hub.id
}