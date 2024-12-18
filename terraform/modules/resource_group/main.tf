# Create a resource group
resource "azurerm_resource_group" "rg" {
  name     = "${var.tenant_shortname}-dev-${var.location}-management"
  location = var.location

  tags = {
    Environment = "Development"
    Project     = "Hello World"
    CreatedBy   = "Terraform"
    ManagedBy   = "GitHub Actions"
  }
}