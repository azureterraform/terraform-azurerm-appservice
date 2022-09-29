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
  os_type             = var.os_type

  sku_name = var.service_plan.sku_name
}
