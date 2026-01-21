variable "sql_name" {
  description = "Name of the Azure SQL Server"
  type        = string
}

variable "sql_db_name" {
  description = "Name of the Azure SQL Database"
  type        = string
}

variable "rg_name" {
  description = "Resource group name"
  type        = string
}

variable "rg_location" {
  description = "Resource group location"
  type        = string
}

variable "sql_version" {
  description = "Azure SQL Server version"
  type        = string
  default     = "12.0"
}

variable "sql_admin_login" {
  description = "SQL administrator login name"
  type        = string
}

variable "aad_admin_login" {
  description = "Azure AD admin login name"
  type        = string
}

variable "aad_admin_object_id" {
  description = "Azure AD admin object ID"
  type        = string
}

variable "key_vault_id" {
  description = "Key Vault ID for storing secrets"
  type        = string
}

variable "collation" {
  description = "SQL database collation"
  type        = string
  default     = "SQL_Latin1_General_CP1_CI_AS"
}

variable "license_type" {
  description = "License type (LicenseIncluded or BasePrice)"
  type        = string
}

variable "max_size_gb" {
  description = "Maximum database size in GB"
  type        = number
}

variable "enclave_type" {
  description = "Enclave type for SQL Database"
  type        = string
  default     = "Default"
}

variable "transparent_data_encryption_enabled" {
  description = "Enable Transparent Data Encryption"
  type        = bool
  default     = true
}

variable "uami_id" {
  description = "User Assigned Managed Identity ID for the SQL Database"
  type        = string
}

variable "vnet_id" {
  description = "Virtual Network ID for Private DNS Zone linking"
  type        = string
}

variable "private_endpoint_subnet_id" {
  description = "Subnet ID for the SQL Private Endpoint"
  type        = string
}

variable "storage_account_id" {
  description = "Storage Account ID used for SQL BULK INSERT access"
  type        = string
}
