resource "azurerm_windows_web_app" "main" {
  count               = var.os_type == "Windows" ? 1 : 0
  name                = format("app-%s", var.name)
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.main.id

  site_config {}
}
