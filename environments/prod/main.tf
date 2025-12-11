terraform {
required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }

  backend "azurerm" {
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

locals {
  resource_group_name = "${var.azurerm_resource_group_prefix}${var.name}${var.environment != "" ? "-${var.environment}" : ""}"
}

resource "azurerm_resource_group" "resource_group" {
  name     = local.resource_group_name
  location = var.location
}

module "main" {
  source              = "../../stacks"
  location = var.location
  resource_group_name = azurerm_resource_group.resource_group.name
  resource_group_dependency = azurerm_resource_group.resource_group
  storage_account_name = var.storage_account_name
  account_tier = var.account_tier
  account_replication_type = var.account_replication_type
  containers = var.containers
  https_traffic_only_enabled = var.https_traffic_only_enabled
  min_tls_version = var.min_tls_version
  tags = var.tags

}
