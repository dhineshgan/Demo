data "azurerm_client_config" "current" {}



resource "azurerm_key_vault" "dg-keyvault" {
  name                        = "dgkeyvault2018"
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false
  sku_name                    = "standard"


}

resource "azurerm_key_vault_access_policy" "kv_access_policy_01" {
  #This policy adds databaseadmin group with below permissions
  key_vault_id       = azurerm_key_vault.dg-keyvault.id
  tenant_id          = data.azurerm_client_config.current.tenant_id
  object_id          = "45725fd5-7c04-4055-ad95-a7d192c29e3f"
  key_permissions    = ["Get", "List"]
  secret_permissions = ["Get", "Backup", "Delete", "List", "Purge", "Recover", "Restore", "Set"]

  depends_on = [azurerm_key_vault.dg-keyvault]
}

