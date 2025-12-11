subscription_id = "7a3c6854-0fe1-42eb-b5b9-800af1e53d70"
name            = "oving_7_kristiang"
environment     = "prod"
location        = "West Europe"
azurerm_resource_group_prefix = "rg-"
storage_account_name = "sakristiang"
account_tier = "Standard"
account_replication_type = "LRS"
containers = [ { name = "tfstate", access_type = "private" } ]
https_traffic_only_enabled = true
min_tls_version = "TLS1_2"
tags = {  }
