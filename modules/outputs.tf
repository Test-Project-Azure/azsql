output "sql_server_id" {
  description = "Azure SQL Server ID"
  value       = azurerm_mssql_server.sql.id
}

output "sql_server_name" {
  description = "Azure SQL Server name"
  value       = azurerm_mssql_server.sql.name
}

output "sql_database_id" {
  description = "Azure SQL Database ID"
  value       = azurerm_mssql_database.db.id
}

output "sql_database_name" {
  description = "Azure SQL Database name"
  value       = azurerm_mssql_database.db.name
}

output "sql_admin_password_secret_id" {
  description = "Key Vault secret ID for SQL admin password"
  value       = azurerm_key_vault_secret.sql_admin_password.id
  sensitive   = true
}

