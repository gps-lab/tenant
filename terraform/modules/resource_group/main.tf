# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "ml-rg"
  location = var.location

  tags = {
    Environment = "Development"
    Project     = "Hello World"
    CreatedBy   = "Terraform"
    ManagedBy   = "GitHub Actions"
  }
}