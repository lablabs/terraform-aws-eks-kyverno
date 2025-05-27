# IMPORTANT: Add addon specific variables here
variable "enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources."
}

variable "kyverno_admission_controller_enabled" {
  type        = bool
  default     = true
  description = "Set to true to enable Thanos Query component"
}

variable "kyverno_admission_controller_service_account_create" {
  type        = bool
  default     = true
  description = "Whether to create the Service Account for the Kyverno Admission Controller component."
}

variable "kyverno_admission_controller_service_account_name" {
  type        = string
  default     = "admission-controller"
  description = "The name of the Service Account for the Kyverno Admission Controller component."
}

variable "kyverno_admission_controller_irsa_role_create" {
  type        = bool
  default     = false
  description = "Whether to create the IRSA role for the Kyverno Admission Controller component."
}

variable "kyverno_admission_controller_irsa_policy_enabled" {
  type        = bool
  default     = false
  description = "Whether to create IAM policy specified by `kyverno_admission_controller_irsa_policy` for the Kyverno Admission Controller component. Mutually exclusive with `kyverno_admission_controller_irsa_assume_role_enabled`."
}

variable "kyverno_admission_controller_irsa_policy" {
  type        = string
  default     = ""
  description = "Policy to be attached to the default role of the Kyverno Admission Controller component. Applied only if `kyverno_admission_controller_irsa_policy_enabled` is `true`."
}

variable "kyverno_admission_controller_irsa_assume_role_enabled" {
  type        = bool
  default     = false
  description = "Whether IRSA for the Kyverno Admission Controller component is allowed to assume role defined by `kyverno_admission_controller_irsa_assume_role_arn`. Mutually exclusive with `kyverno_admission_controller_irsa_policy_enabled`."
}

variable "kyverno_admission_controller_irsa_assume_role_arns" {
  type        = list(string)
  default     = []
  description = "Assume role ARNs for the Kyverno Admission Controller component. Applied only if `kyverno_admission_controller_irsa_assume_role_enabled` is `true`."
}

variable "kyverno_admission_controller_irsa_permissions_boundary" {
  type        = string
  default     = null
  description = "ARN of the policy that is used to set the permissions boundary for the IRSA role of the Kyverno Admission Controller component. Defaults to `\"\"`."
}

variable "kyverno_admission_controller_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies to be attached to default role of the Kyverno Admission Controller component. Where key is arbitrary id and value is policy ARN."
}

variable "kyverno_background_controller_enabled" {
  type        = bool
  default     = true
  description = "Set to true to enable Thanos Query component"
}

variable "kyverno_background_controller_service_account_create" {
  type        = bool
  default     = true
  description = "Whether to create the Service Account for the Kyverno Background Controller component."
}

variable "kyverno_background_controller_service_account_name" {
  type        = string
  default     = "background-controller"
  description = "The name of the Service Account for the Kyverno Background Controller component."
}

variable "kyverno_background_controller_irsa_role_create" {
  type        = bool
  default     = false
  description = "Whether to create the IRSA role for the Kyverno Background Controller component."
}

variable "kyverno_background_controller_irsa_policy_enabled" {
  type        = bool
  default     = false
  description = "Whether to create IAM policy specified by `kyverno_background_controller_irsa_policy` for the Kyverno Background Controller component. Mutually exclusive with `kyverno_background_controller_irsa_assume_role_enabled`."
}

variable "kyverno_background_controller_irsa_policy" {
  type        = string
  default     = ""
  description = "Policy to be attached to the default role of the Kyverno Background Controller component. Applied only if `kyverno_background_controller_irsa_policy_enabled` is `true`."
}

variable "kyverno_background_controller_irsa_assume_role_enabled" {
  type        = bool
  default     = false
  description = "Whether IRSA for the Kyverno Background Controller component is allowed to assume role defined by `kyverno_background_controller_irsa_assume_role_arn`. Mutually exclusive with `kyverno_background_controller_irsa_policy_enabled`."
}

variable "kyverno_background_controller_irsa_assume_role_arns" {
  type        = list(string)
  default     = []
  description = "Assume role ARNs for the Kyverno Background Controller component. Applied only if `kyverno_background_controller_irsa_assume_role_enabled` is `true`."
}

variable "kyverno_background_controller_irsa_permissions_boundary" {
  type        = string
  default     = null
  description = "ARN of the policy that is used to set the permissions boundary for the IRSA role of the Kyverno Background Controller component. Defaults to `\"\"`."
}

variable "kyverno_background_controller_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies to be attached to default role of the Kyverno Background Controller component. Where key is arbitrary id and value is policy ARN."
}

variable "kyverno_cleanup_controller_enabled" {
  type        = bool
  default     = true
  description = "Set to true to enable Thanos Query component"
}

variable "kyverno_cleanup_controller_service_account_create" {
  type        = bool
  default     = true
  description = "Whether to create the Service Account for the Kyverno Cleanup Controller component."
}

variable "kyverno_cleanup_controller_service_account_name" {
  type        = string
  default     = "cleanup-controller"
  description = "The name of the Service Account for the Kyverno Cleanup Controller component."
}

variable "kyverno_cleanup_controller_irsa_role_create" {
  type        = bool
  default     = false
  description = "Whether to create the IRSA role for the Kyverno Cleanup Controller component."
}

variable "kyverno_cleanup_controller_irsa_policy_enabled" {
  type        = bool
  default     = false
  description = "Whether to create IAM policy specified by `kyverno_cleanup_controller_irsa_policy` for the Kyverno Cleanup Controller component. Mutually exclusive with `kyverno_cleanup_controller_irsa_assume_role_enabled`."
}

variable "kyverno_cleanup_controller_irsa_policy" {
  type        = string
  default     = ""
  description = "Policy to be attached to the default role of the Kyverno Cleanup Controller component. Applied only if `kyverno_cleanup_controller_irsa_policy_enabled` is `true`."
}

variable "kyverno_cleanup_controller_irsa_assume_role_enabled" {
  type        = bool
  default     = false
  description = "Whether IRSA for the Kyverno Cleanup Controller component is allowed to assume role defined by `kyverno_cleanup_controller_irsa_assume_role_arn`. Mutually exclusive with `kyverno_cleanup_controller_irsa_policy_enabled`."
}

variable "kyverno_cleanup_controller_irsa_assume_role_arns" {
  type        = list(string)
  default     = []
  description = "Assume role ARNs for the Kyverno Cleanup Controller component. Applied only if `kyverno_cleanup_controller_irsa_assume_role_enabled` is `true`."
}

variable "kyverno_cleanup_controller_irsa_permissions_boundary" {
  type        = string
  default     = null
  description = "ARN of the policy that is used to set the permissions boundary for the IRSA role of the Kyverno Cleanup Controller component. Defaults to `\"\"`."
}

variable "kyverno_cleanup_controller_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies to be attached to default role of the Kyverno Cleanup Controller component. Where key is arbitrary id and value is policy ARN."
}

variable "kyverno_reports_controller_enabled" {
  type        = bool
  default     = true
  description = "Set to true to enable Thanos Query component"
}

variable "kyverno_reports_controller_service_account_create" {
  type        = bool
  default     = true
  description = "Whether to create the Service Account for the Kyverno Reports Controller component."
}

variable "kyverno_reports_controller_service_account_name" {
  type        = string
  default     = "reports-controller"
  description = "The name of the Service Account for the Kyverno Reports Controller component."
}

variable "kyverno_reports_controller_irsa_role_create" {
  type        = bool
  default     = false
  description = "Whether to create the IRSA role for the Kyverno Reports Controller component."
}

variable "kyverno_reports_controller_irsa_policy_enabled" {
  type        = bool
  default     = false
  description = "Whether to create IAM policy specified by `kyverno_reports_controller_irsa_policy` for the Kyverno Reports Controller component. Mutually exclusive with `kyverno_reports_controller_irsa_assume_role_enabled`."
}

variable "kyverno_reports_controller_irsa_policy" {
  type        = string
  default     = ""
  description = "Policy to be attached to the default role of the Kyverno Reports Controller component. Applied only if `kyverno_reports_controller_irsa_policy_enabled` is `true`."
}

variable "kyverno_reports_controller_irsa_assume_role_enabled" {
  type        = bool
  default     = false
  description = "Whether IRSA for the Kyverno Reports Controller component is allowed to assume role defined by `kyverno_reports_controller_irsa_assume_role_arn`. Mutually exclusive with `kyverno_reports_controller_irsa_policy_enabled`."
}

variable "kyverno_reports_controller_irsa_assume_role_arns" {
  type        = list(string)
  default     = []
  description = "Assume role ARNs for the Kyverno Reports Controller component. Applied only if `kyverno_reports_controller_irsa_assume_role_enabled` is `true`."
}

variable "kyverno_reports_controller_irsa_permissions_boundary" {
  type        = string
  default     = null
  description = "ARN of the policy that is used to set the permissions boundary for the IRSA role of the Kyverno Reports Controller component. Defaults to `\"\"`."
}

variable "kyverno_reports_controller_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies to be attached to default role of the Kyverno Reports Controller component. Where key is arbitrary id and value is policy ARN."
}
