variable "sql_servers" {
  description = "Azure SQL Server configurations"
  type = map(object({
    sql_name        = string
    rg_name         = string
    rg_location     = string
    sql_version     = string
    sql_admin_login = string
    aad_admin_login     = string
    aad_admin_object_id = string
    sql_db_name   = string
    collation     = string
    license_type  = string
    max_size_gb   = number
    enclave_type  = string
    transparent_data_encryption_enabled = bool
    uami_id = string
    key_vault_id = string
    vnet_id                    = string
    private_endpoint_subnet_id = string
    storage_account_id = string
  }))
}
