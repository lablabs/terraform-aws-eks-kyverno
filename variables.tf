# IMPORTANT: Add addon specific variables here
variable "enabled" {
  type        = bool
  default     = true
  description = "Set to false to prevent the module from creating any resources."
}

variable "admission_controller_rbac_create" {
  type        = bool
  default     = true
  description = "Whether to create and use Admission Controller RBAC resources."
}

variable "admission_controller_enabled" {
  type        = bool
  default     = true
  description = "Set to true to enable Thanos Query component"
}

variable "admission_controller_service_account_create" {
  type        = bool
  default     = true
  description = "Whether to create the Service Account for the Kyverno Admission Controller component."
}

variable "admission_controller_service_account_name" {
  type        = string
  default     = "admission-controller"
  description = "The name of the Service Account for the Kyverno Admission Controller component."
}

variable "admission_controller_irsa_role_create" {
  type        = bool
  default     = false
  description = "Whether to create the IRSA role for the Kyverno Admission Controller component."
}

variable "admission_controller_irsa_policy_enabled" {
  type        = bool
  default     = false
  description = "Whether to create IAM policy specified by `admission_controller_irsa_policy` for the Kyverno Admission Controller component. Mutually exclusive with `admission_controller_irsa_assume_role_enabled`."
}

variable "admission_controller_irsa_policy" {
  type        = string
  default     = ""
  description = "Policy to be attached to the default role of the Kyverno Admission Controller component. Applied only if `admission_controller_irsa_policy_enabled` is `true`."
}

variable "admission_controller_irsa_assume_role_enabled" {
  type        = bool
  default     = false
  description = "Whether IRSA for the Kyverno Admission Controller component is allowed to assume role defined by `admission_controller_irsa_assume_role_arn`. Mutually exclusive with `admission_controller_irsa_policy_enabled`."
}

variable "admission_controller_irsa_assume_role_arns" {
  type        = list(string)
  default     = []
  description = "Assume role ARNs for the Kyverno Admission Controller component. Applied only if `admission_controller_irsa_assume_role_enabled` is `true`."
}

variable "admission_controller_irsa_permissions_boundary" {
  type        = string
  default     = null
  description = "ARN of the policy that is used to set the permissions boundary for the IRSA role of the Kyverno Admission Controller component. Defaults to `\"\"`."
}

variable "admission_controller_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies to be attached to default role of the Kyverno Admission Controller component. Where key is arbitrary id and value is policy ARN."
}

variable "background_controller_rbac_create" {
  type        = bool
  default     = true
  description = "Whether to create and use Background Controller RBAC resources."
}

variable "background_controller_enabled" {
  type        = bool
  default     = true
  description = "Set to true to enable Thanos Query component"
}

variable "background_controller_service_account_create" {
  type        = bool
  default     = true
  description = "Whether to create the Service Account for the Kyverno Background Controller component."
}

variable "background_controller_service_account_name" {
  type        = string
  default     = "background-controller"
  description = "The name of the Service Account for the Kyverno Background Controller component."
}

variable "background_controller_irsa_role_create" {
  type        = bool
  default     = false
  description = "Whether to create the IRSA role for the Kyverno Background Controller component."
}

variable "background_controller_irsa_policy_enabled" {
  type        = bool
  default     = false
  description = "Whether to create IAM policy specified by `background_controller_irsa_policy` for the Kyverno Background Controller component. Mutually exclusive with `background_controller_irsa_assume_role_enabled`."
}

variable "background_controller_irsa_policy" {
  type        = string
  default     = ""
  description = "Policy to be attached to the default role of the Kyverno Background Controller component. Applied only if `background_controller_irsa_policy_enabled` is `true`."
}

variable "background_controller_irsa_assume_role_enabled" {
  type        = bool
  default     = false
  description = "Whether IRSA for the Kyverno Background Controller component is allowed to assume role defined by `background_controller_irsa_assume_role_arn`. Mutually exclusive with `background_controller_irsa_policy_enabled`."
}

variable "background_controller_irsa_assume_role_arns" {
  type        = list(string)
  default     = []
  description = "Assume role ARNs for the Kyverno Background Controller component. Applied only if `background_controller_irsa_assume_role_enabled` is `true`."
}

variable "background_controller_irsa_permissions_boundary" {
  type        = string
  default     = null
  description = "ARN of the policy that is used to set the permissions boundary for the IRSA role of the Kyverno Background Controller component. Defaults to `\"\"`."
}

variable "background_controller_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies to be attached to default role of the Kyverno Background Controller component. Where key is arbitrary id and value is policy ARN."
}

variable "cleanup_controller_rbac_create" {
  type        = bool
  default     = true
  description = "Whether to create and use Cleanup Controller RBAC resources."
}

variable "cleanup_controller_enabled" {
  type        = bool
  default     = true
  description = "Set to true to enable Thanos Query component"
}

variable "cleanup_controller_service_account_create" {
  type        = bool
  default     = true
  description = "Whether to create the Service Account for the Kyverno Cleanup Controller component."
}

variable "cleanup_controller_service_account_name" {
  type        = string
  default     = "cleanup-controller"
  description = "The name of the Service Account for the Kyverno Cleanup Controller component."
}

variable "cleanup_controller_irsa_role_create" {
  type        = bool
  default     = false
  description = "Whether to create the IRSA role for the Kyverno Cleanup Controller component."
}

variable "cleanup_controller_irsa_policy_enabled" {
  type        = bool
  default     = false
  description = "Whether to create IAM policy specified by `cleanup_controller_irsa_policy` for the Kyverno Cleanup Controller component. Mutually exclusive with `cleanup_controller_irsa_assume_role_enabled`."
}

variable "cleanup_controller_irsa_policy" {
  type        = string
  default     = ""
  description = "Policy to be attached to the default role of the Kyverno Cleanup Controller component. Applied only if `cleanup_controller_irsa_policy_enabled` is `true`."
}

variable "cleanup_controller_irsa_assume_role_enabled" {
  type        = bool
  default     = false
  description = "Whether IRSA for the Kyverno Cleanup Controller component is allowed to assume role defined by `cleanup_controller_irsa_assume_role_arn`. Mutually exclusive with `cleanup_controller_irsa_policy_enabled`."
}

variable "cleanup_controller_irsa_assume_role_arns" {
  type        = list(string)
  default     = []
  description = "Assume role ARNs for the Kyverno Cleanup Controller component. Applied only if `cleanup_controller_irsa_assume_role_enabled` is `true`."
}

variable "cleanup_controller_irsa_permissions_boundary" {
  type        = string
  default     = null
  description = "ARN of the policy that is used to set the permissions boundary for the IRSA role of the Kyverno Cleanup Controller component. Defaults to `\"\"`."
}

variable "cleanup_controller_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies to be attached to default role of the Kyverno Cleanup Controller component. Where key is arbitrary id and value is policy ARN."
}

variable "reports_controller_rbac_create" {
  type        = bool
  default     = true
  description = "Whether to create and use Reports Controller RBAC resources."
}

variable "reports_controller_enabled" {
  type        = bool
  default     = true
  description = "Set to true to enable Thanos Query component"
}

variable "reports_controller_service_account_create" {
  type        = bool
  default     = true
  description = "Whether to create the Service Account for the Kyverno Reports Controller component."
}

variable "reports_controller_service_account_name" {
  type        = string
  default     = "reports-controller"
  description = "The name of the Service Account for the Kyverno Reports Controller component."
}

variable "reports_controller_irsa_role_create" {
  type        = bool
  default     = false
  description = "Whether to create the IRSA role for the Kyverno Reports Controller component."
}

variable "reports_controller_irsa_policy_enabled" {
  type        = bool
  default     = false
  description = "Whether to create IAM policy specified by `reports_controller_irsa_policy` for the Kyverno Reports Controller component. Mutually exclusive with `reports_controller_irsa_assume_role_enabled`."
}

variable "reports_controller_irsa_policy" {
  type        = string
  default     = ""
  description = "Policy to be attached to the default role of the Kyverno Reports Controller component. Applied only if `reports_controller_irsa_policy_enabled` is `true`."
}

variable "reports_controller_irsa_assume_role_enabled" {
  type        = bool
  default     = false
  description = "Whether IRSA for the Kyverno Reports Controller component is allowed to assume role defined by `reports_controller_irsa_assume_role_arn`. Mutually exclusive with `reports_controller_irsa_policy_enabled`."
}

variable "reports_controller_irsa_assume_role_arns" {
  type        = list(string)
  default     = []
  description = "Assume role ARNs for the Kyverno Reports Controller component. Applied only if `reports_controller_irsa_assume_role_enabled` is `true`."
}

variable "reports_controller_irsa_permissions_boundary" {
  type        = string
  default     = null
  description = "ARN of the policy that is used to set the permissions boundary for the IRSA role of the Kyverno Reports Controller component. Defaults to `\"\"`."
}

variable "reports_controller_irsa_additional_policies" {
  type        = map(string)
  default     = {}
  description = "Map of the additional policies to be attached to default role of the Kyverno Reports Controller component. Where key is arbitrary id and value is policy ARN."
}
