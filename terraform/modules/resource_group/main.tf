locals {
  environment        = "dev"
  resource_group_name = "${var.tenant_shortname}-${local.environment}-${var.location}-management"
  current_time       = timestamp()
  formatted_date     = formatdate("YYYY-MM-DD", local.current_time)
  tags = {
    Environment = var.environment
    CreatedBy   = "Terraform"
    ManagedBy   = "GitHub Actions"
    CreatedDate = local.formatted_date
  }
}

resource "azurerm_resource_group" "rg" {
  name     = local.resource_group_name
  location = var.location
  tags     = local.tags
}