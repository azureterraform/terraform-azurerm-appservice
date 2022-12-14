module "appservice" {
  source  = "azureterraform/appservice/azurerm"
  version = "1.0.0"

  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  name    = "test"
  os_type = "Linux"

  service_plan = {
    sku_name     = "B1"
    worker_count = 1
  }
}
