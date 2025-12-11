
variable "resource_group_dependency" {
  description = "Dependency reference to ensure resource group is created first"
  type        = any
  default     = null
}

variable "storage_account_name" {
  type        = string
  description = "Name of the storage account (must be globally unique)"
}

variable "account_tier" {
  type    = string
  default = "Standard"
}

variable "account_replication_type" {
  type    = string
  default = "LRS"
}

variable "containers" {
  type = list(object({
    name        = string
    access_type = string
  }))
  default = []
}

variable "https_traffic_only_enabled" {
  type    = bool
  default = true
}

variable "min_tls_version" {
  type    = string
  default = "TLS1_2"
}

variable "tags" {
  type    = map(string)
  default = {}
}

