variable "subscription_id" { type = string }
variable "name" { type = string }
variable "environment" { type = string }
variable "location" { type = string }

variable "azurerm_resource_group_prefix" {
  type    = string
  default = "rg-"
}
variable "storage_account_name" { type = string }

variable "account_tier" { type = string }

variable "account_replication_type" { type = string }

variable "containers" { type = list(object({ name = string, access_type = string })) }

variable "https_traffic_only_enabled" { type = bool }

variable "min_tls_version" { type = string }

variable "tags" { type = map(string) }

