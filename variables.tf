variable "name" {
  description = "Name used with resources deployed with this module."
  type        = string
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
