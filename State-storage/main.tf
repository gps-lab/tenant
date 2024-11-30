# # state-storage/main.tf

# terraform {
#   required_providers {
#     azurerm = {
#       source  = "hashicorp/azurerm"
#       version = "~> 3.0"
#     }
#     random = {
#       source  = "hashicorp/random"
#       version = "~> 3.0"
#     }
#   }
# }

# provider "azurerm" {
#   features {}
# }

# # Random string for unique storage account name
# resource "random_string" "storage_account_suffix" {
#   length  = 8
#   special = false
#   upper   = false
# }

# # Resource group for state storage
# resource "azurerm_resource_group" "state_rg" {
#   name     = "terraform-state-rg"
#   location = "East US"

#   tags = {
#     Purpose   = "Terraform State"
#     ManagedBy = "Terraform"
#   }
# }

# # Storage account for state
# resource "azurerm_storage_account" "state_storage" {
#   name                     = "tfstate${random_string.storage_account_suffix.result}"
#   resource_group_name      = azurerm_resource_group.state_rg.name
#   location                 = azurerm_resource_group.state_rg.location
#   account_tier             = "Standard"
#   account_replication_type = "LRS"
#   access_tier             = "Cool"
#   min_tls_version         = "TLS1_2"

#   blob_properties {
#     versioning_enabled = true
#     delete_retention_policy {
#       days = 7
#     }
#     container_delete_retention_policy {
#       days = 7
#     }
#   }

#   # Optional: Uncomment if you want to restrict access to specific IP ranges
#   # network_rules {
#   #   default_action = "Deny"
#   #   ip_rules       = ["your-ip-range"]
#   #   bypass         = ["AzureServices"]
#   # }

#   tags = {
#     Purpose   = "Terraform State"
#     ManagedBy = "Terraform"
#   }

#   lifecycle {
#     prevent_destroy = true
#   }
# }

# # Container for state files
# resource "azurerm_storage_container" "state_container" {
#   name                  = "tfstate"
#   storage_account_name  = azurerm_storage_account.state_storage.name
#   container_access_type = "private"
# }

# # Outputs for use in other configurations
# output "storage_account_name" {
#   value = azurerm_storage_account.state_storage.name
# }

# output "container_name" {
#   value = azurerm_storage_container.state_container.name
# }

# output "resource_group_name" {
#   value = azurerm_resource_group.state_rg.name
# }

# # Backend configuration output
# output "backend_config" {
#   value = <<CONFIG
# backend "azurerm" {
#   resource_group_name  = "${azurerm_resource_group.state_rg.name}"
#   storage_account_name = "${azurerm_storage_account.state_storage.name}"
#   container_name      = "${azurerm_storage_container.state_container.name}"
#   key                = "terraform.tfstate"
# }
# CONFIG
# }