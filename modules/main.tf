resource "random_password" "sql_admin_password" {
  length      = 24
  min_lower   = 2
  min_upper   = 4
  min_numeric = 5
  special     = true
}

resource "azurerm_key_vault_secret" "sql_admin_password" {
  name         = "${var.sql_name}-sql-admin-password"
  value        = random_password.sql_admin_password.result
  key_vault_id = var.key_vault_id
}

resource "azurerm_mssql_server" "sql" {
  name                         = var.sql_name
  resource_group_name          = var.rg_name
  location                     = var.rg_location
  version                      = var.sql_version
  administrator_login          = var.sql_admin_login
  administrator_login_password = azurerm_key_vault_secret.sql_admin_password.value
  public_network_access_enabled = false

  identity {
    type = "SystemAssigned"
  }

  azuread_administrator {
    login_username = var.aad_admin_login
    object_id      = var.aad_admin_object_id
  }
}

resource "azurerm_mssql_database" "db" {
  name      = var.sql_db_name
  server_id = azurerm_mssql_server.sql.id

  collation    = var.collation
  license_type = var.license_type
  max_size_gb  = var.max_size_gb

  sku_name     = "GP_S_Gen5_2"
  min_capacity = 0.5
  #max_capacity = 2
  auto_pause_delay_in_minutes = 60

  enclave_type = "Default"

  transparent_data_encryption_enabled = true

  identity {
    type         = "UserAssigned"
    identity_ids = [var.uami_id]
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_private_endpoint" "sql_pe" {
  name                = "${var.sql_name}-pe"
  location            = var.rg_location
  resource_group_name = var.rg_name
  subnet_id           = var.private_endpoint_subnet_id

  private_service_connection {
    name                           = "${var.sql_name}-psc"
    private_connection_resource_id = azurerm_mssql_server.sql.id
    subresource_names              = ["sqlServer"]
    is_manual_connection           = false
  }
}

resource "azurerm_private_dns_zone" "sql_dns" {
  name                = "privatelink.database.windows.net"
  resource_group_name = var.rg_name
}

resource "azurerm_private_dns_zone_virtual_network_link" "sql_dns_link" {
  name                  = "${var.sql_name}-dns-link"
  resource_group_name   = var.rg_name
  private_dns_zone_name = azurerm_private_dns_zone.sql_dns.name
  virtual_network_id   = var.vnet_id
}


resource "azurerm_role_assignment" "sql_storage_access" {
  principal_id         = azurerm_mssql_server.sql.identity[0].principal_id
  role_definition_name = "Storage Blob Data Reader"
  scope                = var.storage_account_id
}
