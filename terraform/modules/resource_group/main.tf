locals {
  environment        = "dev"
  resource_group_name = "${var.tenant_shortname}-${local.environment}-${var.location}-management"
  tags = {
    Environment = var.environment
    CreatedBy   = "Terraform"
    ManagedBy   = "GitHub Actions"
  }
}

resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name
  location = var.location
  tags     = local.tags
}