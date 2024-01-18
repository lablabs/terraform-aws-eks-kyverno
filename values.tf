locals {
  values_default = yamlencode({
    # add default values here
    "admissionController" : {
      "rbac" : {
        "serviceAccount" : {
          "create" : var.service_account_create
          "name" : "${var.service_account_name}-admission-controller"
          "annotations" : {
            # admission controller can sign and check ecr images https://kyverno.io/blog/2023/08/18/verifying-images-in-a-private-amazon-ecr-with-kyverno-and-iam-roles-for-service-accounts-irsa/
            "eks.amazonaws.com/role-arn" : local.irsa_role_create ? aws_iam_role.this[0].arn : ""
          }
        }
      }
    }
    "backgroundController" : {
      "rbac" : {
        "serviceAccount" : {
          "create" : var.service_account_create
          "name" : "${var.service_account_name}-background-controller"
        }
      }
    }
    "cleanupController" : {
      "rbac" : {
        "serviceAccount" : {
          "create" : var.service_account_create
          "name" : "${var.service_account_name}-cleanup-controller"
        }
      }
    }
    "reportsController" : {
      "rbac" : {
        "serviceAccount" : {
          "create" : var.service_account_create
          "name" : "${var.service_account_name}-reports-controller"
        }
      }
    }
  })
}

data "utils_deep_merge_yaml" "values" {
  count = var.enabled ? 1 : 0
  input = compact([
    local.values_default,
    var.values
  ])
}
