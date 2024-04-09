provider "azurerm" {
  features {}
}

locals {
  resource_prefix = "asdf"
  environment = "Tests"
}

resource "azurerm_resource_group" "rg" {
  name     = "${local.resource_prefix}-RG"
  location = "West Europe"
}

resource "azurerm_storage_account" "storacc" {
  name                     = "${local.resource_prefix}functionapptstsa"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  # Drata: Configure [azurerm_storage_account.account_replication_type] to improve infrastructure availability and resilience. To create highly available Storage Accounts, set azurerm_storage_account.account_replication_type to a geo-redundant storage option by selecting one of the following SKUs: ['standard_grs', 'standard_gzrs', 'standard_ragrs', 'standard_ragzrs', 'grs', 'gzrs', 'ragrs', 'ragzrs']
}

resource "azurerm_app_service_plan" "svcplanconsumption" {
  name                = "${local.resource_prefix}-service-plan"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  kind                = "FunctionApp"

  sku {
    tier = "Dynamic"
    size = "Y1"
  }
}

resource "azurerm_function_app" "functionapp" {
  name = "${local.resource_prefix}-functionapp"
  location                   = azurerm_resource_group.rg.location
  resource_group_name        = azurerm_resource_group.rg.name
  app_service_plan_id        = azurerm_app_service_plan.svcplanconsumption.id
  storage_account_name       = azurerm_storage_account.storacc.name
  storage_account_access_key = azurerm_storage_account.storacc.primary_access_key

  site_config {
    http2_enabled = false
  }
}
