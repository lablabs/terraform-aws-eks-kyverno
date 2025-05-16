# IMPORTANT: Add addon specific variables here
variable "enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources."
}

variable "admission_controller_service_account_create" {
  type        = bool
  default     = true
  description = "Whether to create the Service Account for the Admission Controller."
}

variable "admission_controller_service_account_name" {
  type        = string
  default     = "admission-controler"
  description = "The name of the Service Account for the Admission Controller."
}

variable "admission_controller_irsa_role_create" {
  type        = bool
  default     = true
  description = "Whether to create the IRSA role for the Admission Controller."
}

variable "admission_controller_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies to be attached to default role of the Admission Controller. Where key is arbitrary id and value is policy ARN."
}

variable "background_controller_service_account_create" {
  type        = bool
  default     = true
  description = "Whether to create the Service Account for the Background Operator."
}

variable "background_controller_service_account_name" {
  type        = string
  default     = "background-controler"
  description = "The name of the Service Account for the Background Operator."
}

variable "background_controller_irsa_role_create" {
  type        = bool
  default     = true
  description = "Whether to create the IRSA role for the Background Operator."
}

variable "background_controller_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies to be attached to default role of the Background Operator. Where key is arbitrary id and value is policy ARN."
}

variable "cleanup_controller_service_account_create" {
  type        = bool
  default     = true
  description = "Set to false to prevent the Cleanup Controller Service Account from being created."
}

variable "cleanup_controller_service_account_name" {
  type        = string
  default     = "cleanup_controller"
  description = "Name of the Cleanup Controller Service Account."
  nullable    = false
}

variable "cleanup_controller_irsa_role_create" {
  type        = bool
  default     = true
  description = "Set to false to prevent the Cleanup Controller IRSA role from being created."
}

variable "cleanup_controller_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Additional IAM policies to attach to the Cleanup Controller IRSA role."
}

variable "reports_controller_service_account_create" {
  type        = bool
  default     = true
  description = "Set to false to prevent the Reports Controller Service Account from being created."
}

variable "reports_controller_service_account_name" {
  type        = string
  default     = "reports_controller"
  description = "Name of the Reports Controller Service Account."
  nullable    = false
}

variable "reports_controller_irsa_role_create" {
  type        = bool
  default     = true
  description = "Set to false to prevent the Reports Controller IRSA role from being created."
}

variable "reports_controller_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Additional IAM policies to attach to the Reports Controller IRSA role."
}
