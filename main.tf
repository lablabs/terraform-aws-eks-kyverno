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
    "${local.addon.name}-admission-controller" = {
      service_account_create   = var.admission_controller_service_account_create
      service_account_name     = var.admission_controller_service_account_name
      irsa_role_create         = var.admission_controller_irsa_role_create
      irsa_role_name           = "admission"
      irsa_additional_policies = var.admission_controller_irsa_additional_policies
    }
    "${local.addon.name}-background-controller" = {
      service_account_create   = var.background_controller_service_account_create
      service_account_name     = var.background_controller_service_account_name
      irsa_role_create         = var.background_controller_irsa_role_create
      irsa_role_name           = "background"
      irsa_additional_policies = var.background_controller_irsa_additional_policies
    }
    "${local.addon.name}-cleanup-controller" = {
      service_account_create   = var.cleanup_controller_service_account_create
      service_account_name     = var.cleanup_controller_service_account_name
      irsa_role_create         = var.cleanup_controller_irsa_role_create
      irsa_role_name           = "cleanup"
      irsa_additional_policies = var.cleanup_controller_irsa_additional_policies
    }
    "${local.addon.name}-reports-controller" = {
      service_account_create   = var.reports_controller_service_account_create
      service_account_name     = var.reports_controller_service_account_name
      irsa_role_create         = var.reports_controller_irsa_role_create
      irsa_role_name           = "reports"
      irsa_additional_policies = var.reports_controller_irsa_additional_policies
    }
  }

  addon_values = yamlencode({
    admissionController = {
      rbac = {
        serviceAccount = {
          create = local.addon_irsa["${local.addon.name}-admission-controller"].service_account_create
          name   = local.addon_irsa["${local.addon.name}-admission-controller"].service_account_name
          annotations = module.addon-irsa["${local.addon.name}-admission-controller"].irsa_role_enabled ? {
            "eks.amazonaws.com/role-arn" = module.addon-irsa["${local.addon.name}-admission-controller"].iam_role_attributes.arn
          } : tomap({})
        }
      }
    }
    backgroundController = {
      rbac = {
        serviceAccount = {
          create = local.addon_irsa["${local.addon.name}-background-controller"].service_account_create
          name   = local.addon_irsa["${local.addon.name}-background-controller"].service_account_name
          annotations = module.addon-irsa["${local.addon.name}-background-controller"].irsa_role_enabled ? {
            "eks.amazonaws.com/role-arn" = module.addon-irsa["${local.addon.name}-background-controller"].iam_role_attributes.arn
          } : tomap({})
        }
      }
    }
    cleanupController = {
      rbac = {
        serviceAccount = {
          create = local.addon_irsa["${local.addon.name}-cleanup-controller"].service_account_create
          name   = local.addon_irsa["${local.addon.name}-cleanup-controller"].service_account_name
          annotations = module.addon-irsa["${local.addon.name}-cleanup-controller"].irsa_role_enabled ? {
            "eks.amazonaws.com/role-arn" = module.addon-irsa["${local.addon.name}-cleanup-controller"].iam_role_attributes.arn
          } : tomap({})
        }
      }
    }
    reportsController = {
      rbac = {
        serviceAccount = {
          create = local.addon_irsa["${local.addon.name}-reports-controller"].service_account_create
          name   = local.addon_irsa["${local.addon.name}-reports-controller"].service_account_name
          annotations = module.addon-irsa["${local.addon.name}-reports-controller"].irsa_role_enabled ? {
            "eks.amazonaws.com/role-arn" = module.addon-irsa["${local.addon.name}-reports-controller"].iam_role_attributes.arn
          } : tomap({})
        }
      }
    }
  })
}
