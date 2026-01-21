sql_servers = {
  sql-p-weu = {
    sql_name        = "sql-p-weu"
    rg_name         = "rg-d-agent-group"
    rg_location     = "westeurope"
    sql_version     = "12.0"
    sql_admin_login = "adminuser"
    aad_admin_login     = "sql-admins"
    aad_admin_object_id = "419009b0-fe3e-4a3f-83cd-2983ce60ca5e"
    sql_db_name   = "sql-p-weu-db"
    collation     = "Latin1_General_100_CI_AI_SC_UTF8"
    license_type  = "LicenseIncluded"
    max_size_gb   = 90
    enclave_type  = "Default"
    transparent_data_encryption_enabled = true
    uami_id = "/subscriptions/21a91bed-d635-447a-aec9-e80f32c23443/resourceGroups/rg-d-agent-group/providers/Microsoft.ManagedIdentity/userAssignedIdentities/usermui"
    key_vault_id = "/subscriptions/21a91bed-d635-447a-aec9-e80f32c23443/resourceGroups/rg-d-agent-group/providers/Microsoft.KeyVault/vaults/kv-d-agent-linx"
    vnet_id = "/subscriptions/21a91bed-d635-447a-aec9-e80f32c23443/resourceGroups/rg-d-agent-group/providers/Microsoft.Network/virtualNetworks/vnet-sql"
    private_endpoint_subnet_id = "/subscriptions/21a91bed-d635-447a-aec9-e80f32c23443/resourceGroups/rg-d-agent-group/providers/Microsoft.Network/virtualNetworks/vnet-sql/subnets/default"
    storage_account_id = "/subscriptions/21a91bed-d635-447a-aec9-e80f32c23443/resourceGroups/rg-d-agent-group/providers/Microsoft.Storage/storageAccounts/sadeveastus"
  }
}
