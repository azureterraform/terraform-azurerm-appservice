resource "azurerm_linux_web_app" "main" {
  count               = var.os_type == "Linux" ? 1 : 0
  name                = format("app-%s", var.name)
  resource_group_name = var.resource_group_name
  location            = var.location
  service_plan_id     = azurerm_service_plan.main.id

  site_config {}
}

resource "azurerm_linux_web_app_slot" "main" {
  name           = format("slot-%s", var.name)
  app_service_id = azurerm_linux_web_app.main[0].id

  site_config {}
}
