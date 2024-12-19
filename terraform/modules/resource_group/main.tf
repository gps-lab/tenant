locals {
  environment        = "dev"
  resource_group_name = "${var.tenant_shortname}-${local.environment}-${var.location}-management"
  tags = {
    Environment = "Development"
    CreatedBy   = "Terraform"
    ManagedBy   = "GitHub Actions"
    Project     = "Hello World"
  }
}

resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name
  location = var.location
  tags     = local.tags
}