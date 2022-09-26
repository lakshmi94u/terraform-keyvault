data "azurerm_client_config" "config" {
  
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}