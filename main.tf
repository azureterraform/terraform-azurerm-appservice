/*
* # terraform-azurerm-appservice
*
* This module aims to be easy to use, flexible, while give the user the guidelines to choose secure options for deploying Azure App Services.
*
* >Note: This module follows the naming convention outlined in the Cloud Adoption Framework found [here](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations?WT.mc_id=AZ-MVP-5004348). Resources will be prefixed with the appropriate abbreviations.
*/

resource "azurerm_service_plan" "main" {
  name                = format("plan-%s", var.name)
  resource_group_name = var.resource_group_name
  location            = var.location
  os_type             = var.service_plan.windows_container != false ? "WindowsContainer" : var.os_type
  sku_name            = var.service_plan.sku_name

  worker_count                 = var.service_plan.worker_count
  maximum_elastic_worker_count = var.service_plan.maximum_elastic_worker_count
  app_service_environment_id   = var.service_plan.app_service_environment_id
  per_site_scaling_enabled     = var.service_plan.per_site_scaling_enabled
  zone_balancing_enabled       = var.service_plan.zone_balancing_enabled
}
