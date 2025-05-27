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
      rbac_create            = var.kyverno_admission_controller_rbac_create
      service_account_create = var.kyverno_admission_controller_service_account_create
      service_account_name   = var.kyverno_admission_controller_service_account_name

      irsa_role_create          = var.kyverno_admission_controller_irsa_role_create
      irsa_policy_enabled       = var.kyverno_admission_controller_irsa_policy_enabled
      irsa_policy               = var.kyverno_admission_controller_irsa_policy
      irsa_assume_role_enabled  = var.kyverno_admission_controller_irsa_assume_role_enabled
      irsa_assume_role_arns     = var.kyverno_admission_controller_irsa_assume_role_arns
      irsa_permissions_boundary = var.kyverno_admission_controller_irsa_permissions_boundary
      irsa_additional_policies  = var.kyverno_admission_controller_irsa_additional_policies
    }
    "background-controller" = {
      rbac_create            = var.kyverno_background_controller_rbac_create
      service_account_create = var.kyverno_background_controller_service_account_create
      service_account_name   = var.kyverno_background_controller_service_account_name

      irsa_role_create          = var.kyverno_background_controller_irsa_role_create
      irsa_policy_enabled       = var.kyverno_background_controller_irsa_policy_enabled
      irsa_policy               = var.kyverno_background_controller_irsa_policy
      irsa_assume_role_enabled  = var.kyverno_background_controller_irsa_assume_role_enabled
      irsa_assume_role_arns     = var.kyverno_background_controller_irsa_assume_role_arns
      irsa_permissions_boundary = var.kyverno_background_controller_irsa_permissions_boundary
      irsa_additional_policies  = var.kyverno_background_controller_irsa_additional_policies
    }
    "cleanup-controller" = {
      rbac_create            = var.kyverno_cleanup_controller_rbac_create
      service_account_create = var.kyverno_cleanup_controller_service_account_create
      service_account_name   = var.kyverno_cleanup_controller_service_account_name

      irsa_role_create          = var.kyverno_cleanup_controller_irsa_role_create
      irsa_policy_enabled       = var.kyverno_cleanup_controller_irsa_policy_enabled
      irsa_policy               = var.kyverno_cleanup_controller_irsa_policy
      irsa_assume_role_enabled  = var.kyverno_cleanup_controller_irsa_assume_role_enabled
      irsa_assume_role_arns     = var.kyverno_cleanup_controller_irsa_assume_role_arns
      irsa_permissions_boundary = var.kyverno_cleanup_controller_irsa_permissions_boundary
      irsa_additional_policies  = var.kyverno_cleanup_controller_irsa_additional_policies
    }
    "reports-controller" = {
      rbac_create            = var.kyverno_reports_controller_rbac_create
      service_account_create = var.kyverno_reports_controller_service_account_create
      service_account_name   = var.kyverno_reports_controller_service_account_name

      irsa_role_create          = var.kyverno_reports_controller_irsa_role_create
      irsa_policy_enabled       = var.kyverno_reports_controller_irsa_policy_enabled
      irsa_policy               = var.kyverno_reports_controller_irsa_policy
      irsa_assume_role_enabled  = var.kyverno_reports_controller_irsa_assume_role_enabled
      irsa_assume_role_arns     = var.kyverno_reports_controller_irsa_assume_role_arns
      irsa_permissions_boundary = var.kyverno_reports_controller_irsa_permissions_boundary
      irsa_additional_policies  = var.kyverno_reports_controller_irsa_additional_policies
    }
  }

  addon_values = yamlencode({
    admissionController = {
      enabled = var.kyverno_admission_controller_enabled
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
      enabled = var.kyverno_background_controller_enabled
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
      enabled = var.kyverno_cleanup_controller_enabled
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
      enabled = var.kyverno_reports_controller_enabled
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
