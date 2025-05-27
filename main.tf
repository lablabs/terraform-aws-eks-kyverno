/**
 * # AWS EKS Kyverno Terraform module
 *
 * A Terraform module to deploy the [Kyverno](https://kyverno.io) on Amazon EKS cluster.
 *
 * [![Terraform validate](https://github.com/lablabs/terraform-aws-eks-kyverno/actions/workflows/validate.yaml/badge.svg)](https://github.com/lablabs/terraform-aws-eks-kyverno/actions/workflows/validate.yaml)
 * [![pre-commit](https://github.com/lablabs/terraform-aws-eks-kyverno/actions/workflows/pre-commit.yml/badge.svg)](https://github.com/lablabs/terraform-aws-eks-kyverno/actions/workflows/pre-commit.yml)
 */

locals {
  addon = {
    name = "kyverno"

    helm_chart_version = "3.3.7"
    helm_repo_url      = "hhttps://kyverno.github.io/kyverno"
  }

  addon_irsa = {
    "admission-controller" = {
      rbac_create            = var.admission_controller_rbac_create
      service_account_create = var.admission_controller_service_account_create
      service_account_name   = var.admission_controller_service_account_name

      irsa_role_create          = var.admission_controller_irsa_role_create
      irsa_policy_enabled       = var.admission_controller_irsa_policy_enabled
      irsa_policy               = var.admission_controller_irsa_policy
      irsa_assume_role_enabled  = var.admission_controller_irsa_assume_role_enabled
      irsa_assume_role_arns     = var.admission_controller_irsa_assume_role_arns
      irsa_permissions_boundary = var.admission_controller_irsa_permissions_boundary
      irsa_additional_policies  = var.admission_controller_irsa_additional_policies
    }
    "background-controller" = {
      rbac_create            = var.background_controller_rbac_create
      service_account_create = var.background_controller_service_account_create
      service_account_name   = var.background_controller_service_account_name

      irsa_role_create          = var.background_controller_irsa_role_create
      irsa_policy_enabled       = var.background_controller_irsa_policy_enabled
      irsa_policy               = var.background_controller_irsa_policy
      irsa_assume_role_enabled  = var.background_controller_irsa_assume_role_enabled
      irsa_assume_role_arns     = var.background_controller_irsa_assume_role_arns
      irsa_permissions_boundary = var.background_controller_irsa_permissions_boundary
      irsa_additional_policies  = var.background_controller_irsa_additional_policies
    }
    "cleanup-controller" = {
      rbac_create            = var.cleanup_controller_rbac_create
      service_account_create = var.cleanup_controller_service_account_create
      service_account_name   = var.cleanup_controller_service_account_name

      irsa_role_create          = var.cleanup_controller_irsa_role_create
      irsa_policy_enabled       = var.cleanup_controller_irsa_policy_enabled
      irsa_policy               = var.cleanup_controller_irsa_policy
      irsa_assume_role_enabled  = var.cleanup_controller_irsa_assume_role_enabled
      irsa_assume_role_arns     = var.cleanup_controller_irsa_assume_role_arns
      irsa_permissions_boundary = var.cleanup_controller_irsa_permissions_boundary
      irsa_additional_policies  = var.cleanup_controller_irsa_additional_policies
    }
    "reports-controller" = {
      rbac_create            = var.reports_controller_rbac_create
      service_account_create = var.reports_controller_service_account_create
      service_account_name   = var.reports_controller_service_account_name

      irsa_role_create          = var.reports_controller_irsa_role_create
      irsa_policy_enabled       = var.reports_controller_irsa_policy_enabled
      irsa_policy               = var.reports_controller_irsa_policy
      irsa_assume_role_enabled  = var.reports_controller_irsa_assume_role_enabled
      irsa_assume_role_arns     = var.reports_controller_irsa_assume_role_arns
      irsa_permissions_boundary = var.reports_controller_irsa_permissions_boundary
      irsa_additional_policies  = var.reports_controller_irsa_additional_policies
    }
  }

  addon_values = yamlencode({
    admissionController = {
      enabled = var.admission_controller_enabled
      rbac = {
        create = module.addon-irsa["admission-controller"].rbac_create
        serviceAccount = {
          name = module.addon-irsa["admission-controller"].service_account_name
          annotations = module.addon-irsa["admission-controller"].irsa_role_enabled ? {
            "eks.amazonaws.com/role-arn" = module.addon-irsa["admission-controller"].iam_role_attributes.arn
          } : tomap({})
        }
      }
    }
    backgroundController = {
      enabled = var.background_controller_enabled
      rbac = {
        create = module.addon-irsa["background-controller"].rbac_create
        serviceAccount = {
          name = module.addon-irsa["background-controller"].service_account_name
          annotations = module.addon-irsa["background-controller"].irsa_role_enabled ? {
            "eks.amazonaws.com/role-arn" = module.addon-irsa["background-controller"].iam_role_attributes.arn
          } : tomap({})
        }
      }
    }
    cleanupController = {
      enabled = var.cleanup_controller_enabled
      rbac = {
        create = module.addon-irsa["cleanup-controller"].rbac_create
        serviceAccount = {
          name = module.addon-irsa["cleanup-controller"].service_account_name
          annotations = module.addon-irsa["cleanup-controller"].irsa_role_enabled ? {
            "eks.amazonaws.com/role-arn" = module.addon-irsa["cleanup-controller"].iam_role_attributes.arn
          } : tomap({})
        }
      }
    }
    reportsController = {
      enabled = var.reports_controller_enabled
      rbac = {
        create = module.addon-irsa["reports-controller"].rbac_create
        serviceAccount = {
          name = module.addon-irsa["reports-controller"].service_account_name
          annotations = module.addon-irsa["reports-controller"].irsa_role_enabled ? {
            "eks.amazonaws.com/role-arn" = module.addon-irsa["reports-controller"].iam_role_attributes.arn
          } : tomap({})
        }
      }
    }
  })

  addon_depends_on = []
}
