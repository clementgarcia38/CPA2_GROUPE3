resource "azurerm_storage_account" "storage_queue" {
  name                     = "queuestoragecpa2"
  resource_group_name      = azurerm_resource_group.rg_hub.name
  location                 = local.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  account_kind             = "StorageV2"
  queue_properties {

  }
}
resource "azurerm_storage_queue" "example" {
  name                 = "queueformulaire"
  storage_account_name = azurerm_storage_account.storage_queue.name
}