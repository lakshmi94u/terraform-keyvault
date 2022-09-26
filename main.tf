locals {
  acces_policy =  [ {
     application_id = null
     certificate_permissions = [ "Get","List" ]
     key_permissions = [ "Get" ]
     object_id = "9c51ad00-e148-4a61-a23c-093095084e60"
     secret_permissions = [ "Backup","List"]
     storage_permissions = [ "Backup" ]
   },
   {
     application_id = null
     certificate_permissions = [ "Get","List" ]
     key_permissions = [ "Get" ]
     object_id = "f4370a51-8ffd-4a8c-ab5b-68aa079a6bac"
     secret_permissions = [ "Backup","List"]
     storage_permissions = [ "Backup" ] 
   } ]
}

resource "azurerm_key_vault" "key_vault" {
   name = var.keyvault_name
   resource_group_name = var.resource_group_name
   location = var.location
   enabled_for_disk_encryption  = false
   purge_protection_enabled = false
   sku_name = "standard"
   tenant_id = data.azurerm_client_config.config.tenant_id
/*
   access_policy = [ {
     application_id = ""
     certificate_permissions = [ "Get","List" ]
     key_permissions = [ "Get" ]
     object_id = "9c51ad00-e148-4a61-a23c-093095084e60"
     secret_permissions = [ "Backup","List"]
     storage_permissions = [ "Backup" ]
     tenant_id = "20946dea-bf71-4235-a4c7-d4b6924cf1bc"
   } ] */
}

resource "azurerm_key_vault_access_policy" "access_policy" {
 count =  length(local.acces_policy)
  application_id = local.acces_policy[count.index].application_id 
  object_id = local.acces_policy[count.index].object_id
  secret_permissions = local.acces_policy[count.index].secret_permissions
  key_permissions = local.acces_policy[count.index].key_permissions
  storage_permissions = local.acces_policy[count.index].storage_permissions
  certificate_permissions = local.acces_policy[count.index].certificate_permissions
  key_vault_id = azurerm_key_vault.key_vault.id
  tenant_id = var.tenant_id

}
