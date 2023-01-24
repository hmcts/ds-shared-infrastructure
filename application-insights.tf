resource "azurerm_application_insights" "appinsights" {
  name                = "${var.product}-${var.env}"
  location            = var.appinsights_location
  resource_group_name = azurerm_resource_group.rg.name
  application_type    = "web"

  tags = var.common_tags

  lifecycle {
    ignore_changes = [
      # Ignore changes to appinsights as otherwise upgrading to the Azure provider 2.x
      # destroys and re-creates this appinsights instance
      application_type,
    ]
  }
}

# resource "azurerm_key_vault_secret" "appInsights-InstrumentationKey" {
#  name         = "AppInsightsInstrumentationKey"
#  value        = azurerm_application_insights.appinsights.instrumentation_key
#  key_vault_id = module.fis-kv-vault.key_vault_id
# }
