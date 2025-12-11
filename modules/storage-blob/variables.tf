variable "location" {
  type        = string
  description = "Azure region for the storage account"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account (must be globally unique)"
}

variable "account_tier" {
  type        = string
  description = "Storage account tier (Standard or Premium)"
  default     = "Standard"
}

variable "account_replication_type" {
  type        = string
  description = "Storage account replication type (LRS, GRS, RAGRS, ZRS, GZRS, RAGZRS)"
  default     = "LRS"
}

variable "containers" {
  type = list(object({
    name        = string
    access_type = string
  }))
  description = "List of blob containers to create"
  default     = []
}

variable "https_traffic_only_enabled" {
  type        = bool
  description = "Force HTTPS traffic only"
  default     = true
}

variable "min_tls_version" {
  type        = string
  description = "Minimum TLS version"
  default     = "TLS1_2"
}

variable "tags" {
  type        = map(string)
  description = "Tags to apply to resources"
  default     = {}
}

