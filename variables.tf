variable "name" {
  description = "Name used with resources deployed with this module."
  type        = string
}

variable "resource_group_name" {
  description = "The resource group used for the resources."
  type        = string
}

variable "location" {
  description = "The location the resources will be deployed to."
  type        = string
}

variable "service_plan" {
  description = <<EOT
  This object describes the service plan used for your app services. If you want to deploy a windows container, please set windows_container to true.
  
  The only required attribute is sku_name, which has to be one of the following:
  B1, B2, B3, D1, F1, I1, I2, I3, I1v2, I2v2, I3v2, P1v2, P2v2, P3v2, P1v3, P2v3, P3v3, S1, S2, S3, SHARED, EP1, EP2, EP3, WS1, WS2, WS3, or Y1.
  EOT
  type = object({
    sku_name                     = string
    windows_container            = optional(bool, false)
    app_service_environment_id   = optional(string)
    maximum_elastic_worker_count = optional(number)
    worker_count                 = optional(number)
    per_site_scaling_enabled     = optional(bool, false)
  })
  validation {
    condition = contains([
      "B1", "B2", "B3", "D1", "F1", "I1", "I2", "I3",
      "I1v2", "I2v2", "I3v2", "P1v2", "P2v2", "P3v2",
      "P1v3", "P2v3", "P3v3", "S1", "S2", "S3", "SHARED",
      "EP1", "EP2", "EP3", "WS1", "WS2", "WS3", "Y1"
    ], var.service_plan.sku_name)
    error_message = <<EOT
    The sku_name attribute has to contain one of the following:
    B1, B2, B3, D1, F1, I1, I2, I3, I1v2, I2v2, I3v2, P1v2, P2v2, P3v2, P1v3, P2v3, P3v3, S1, S2, S3, SHARED, EP1, EP2, EP3, WS1, WS2, WS3, or Y1.
    EOT
  }
}

variable "os_type" {
  description = <<EOT
  (Optional) Which OS do you want to deploy your App Service with?
  Can be either `Linux` or `Windows`, defaults to `Linux`.
  EOT
  type        = string
  default     = "Linux"
  validation {
    condition     = contains(["Linux", "Windows"], var.os_type)
    error_message = "This variable only accepts the string Linux or Windows."
  }
}
