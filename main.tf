module "sql_servers" {
  source = "./modules/azure-sql"
  providers = {
    azurerm = azurerm
    random  = random
  }
  for_each = {
    for _, value in var.sql_servers :
    value.sql_name => value
  }
  sql_name        = each.value.sql_name
  rg_name         = each.value.rg_name
  rg_location     = each.value.rg_location
  sql_version     = each.value.sql_version
  sql_admin_login = each.value.sql_admin_login
  aad_admin_login     = each.value.aad_admin_login
  aad_admin_object_id = each.value.aad_admin_object_id
  sql_db_name   = each.value.sql_db_name
  collation     = each.value.collation
  license_type  = each.value.license_type
  max_size_gb   = each.value.max_size_gb
  enclave_type  = each.value.enclave_type
  transparent_data_encryption_enabled = each.value.transparent_data_encryption_enabled
  uami_id      = each.value.uami_id
  key_vault_id = each.value.key_vault_id
  vnet_id                    = each.value.vnet_id
  private_endpoint_subnet_id = each.value.private_endpoint_subnet_id
  storage_account_id         = each.value.storage_account_id
}
