# Output the resource group id
output "resource_group_id" {
  value = azurerm_resource_group.rg.id
}

# output the resource name
output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}
