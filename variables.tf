variable "resource_group_name" {
  description = "Name of the resource group to be imported."
  type        = string
}

variable "location" {
  description = "The location of the resource group."
  type        = string
  default     = null
}

variable "keyvault_name" {
  description = "The name of the keyvault"
  type = string
}

  variable "acces_policy" {
    type = list(object({
      object_id = string,
      application_id = string,
      key_permissions = list(string),
      secret_permissions = list(string),
      certificate_permissions = list(string),
      storage_permissions = list(string)
    }))
    default = [ ]
  }

  variable "tenant_id" {
    type = string
    default = "20946dea-bf71-4235-a4c7-d4b6924cf1bc"
    
  }