
  resource "azurerm_subnet" "sub_aks" {
  name                 = "subaks"
  resource_group_name  = azurerm_resource_group.rg_spoke.name
  virtual_network_name = azurerm_virtual_network.network_spoke.name
  address_prefixes     = ["10.2.1.0/24"]
  }

resource "azurerm_kubernetes_cluster" "aks" {
  name                = "akscpa2"
  location            = local.location
  resource_group_name = azurerm_resource_group.rg_spoke.name
  dns_prefix          = "akscpa2"

  network_profile {
    network_plugin = "azure"
  }

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_B2s"
    vnet_subnet_id = azurerm_subnet.sub_aks.id
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    env = "prod"
    scope = "client"
  }
}