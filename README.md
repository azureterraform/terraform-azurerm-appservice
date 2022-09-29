<!-- BEGIN_TF_DOCS -->
# terraform-azurerm-appservice

This module aims to be easy to use, flexible, while give the user the guidelines to choose secure options for deploying Azure App Services.

>Note: This module follows the naming convention outlined in the Cloud Adoption Framework found [here](https://learn.microsoft.com/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations?WT.mc_id=AZ-MVP-5004348). Resources will be prefixed with the appropriate abbreviations.

[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=azureterraform_terraform-azurerm-appservice&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=azureterraform_terraform-azurerm-appservice)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.3.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.21.1 |

## Example

```hcl
module "appservice" {
  #source = "azureterraform/appservice/azurerm"
  source = "../"

  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location

  name    = "test"
  os_type = "Linux"

  service_plan = {
    sku_name          = "B1"
    worker_count      = 1
    windows_container = true
  }
}
```

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=3.21.1 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_location"></a> [location](#input\_location) | The location the resources will be deployed to. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name used with resources deployed with this module. | `string` | n/a | yes |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | (Optional) Which OS do you want to deploy your App Service with?<br>  Can be either `Linux` or `Windows`, defaults to `Linux`. | `string` | `"Linux"` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | The resource group used for the resources. | `string` | n/a | yes |
| <a name="input_service_plan"></a> [service\_plan](#input\_service\_plan) | This object describes the service plan used for your app services. If you want to deploy a windows container, please set windows\_container to true.<br><br>  The only required attribute is sku\_name, which has to be one of the following:<br>  B1, B2, B3, D1, F1, I1, I2, I3, I1v2, I2v2, I3v2, P1v2, P2v2, P3v2, P1v3, P2v3, P3v3, S1, S2, S3, SHARED, EP1, EP2, EP3, WS1, WS2, WS3, or Y1. | <pre>object({<br>    sku_name                     = string<br>    windows_container            = optional(bool, false)<br>    app_service_environment_id   = optional(string)<br>    maximum_elastic_worker_count = optional(number)<br>    worker_count                 = optional(number)<br>    per_site_scaling_enabled     = optional(bool, false)<br>    zone_balancing_enabled       = optional(bool, false)<br>  })</pre> | n/a | yes |

## Outputs

No outputs.

## Resources

| Name | Type |
|------|------|
| [azurerm_service_plan.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/service_plan) | resource |
<!-- END_TF_DOCS -->