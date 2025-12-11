

module "storage_blob" {
  source                    = "../modules/storage-blob"
  location                  = var.location
  resource_group_name       = var.resource_group_name
  storage_account_name      = var.storage_account_name
  account_tier              = var.account_tier
  account_replication_type  = var.account_replication_type
  containers                = var.containers
  https_traffic_only_enabled = var.https_traffic_only_enabled
  min_tls_version           = var.min_tls_version
  tags                      = var.tags

  # Ensure dependency on resource group
  depends_on = [var.resource_group_dependency]
}
