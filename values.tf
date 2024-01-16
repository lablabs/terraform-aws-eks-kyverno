locals {
  values_default = yamlencode({
    # add default values here
    "admissionController" : {
      "rbac" : {
        "serviceAccount" : {
          "create" : var.service_account_create
          "name" : "${var.service_account_name}-admission-controller"
          "annotations" : {
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
          "annotations" : {
            "eks.amazonaws.com/role-arn" : local.irsa_role_create ? aws_iam_role.this[0].arn : ""
          }
        }
      }
    }
    "cleanupController" : {
      "rbac" : {
        "serviceAccount" : {
          "create" : var.service_account_create
          "name" : "${var.service_account_name}-cleanup-controller"
          "annotations" : {
            "eks.amazonaws.com/role-arn" : local.irsa_role_create ? aws_iam_role.this[0].arn : ""
          }
        }
      }
    }
    "reportsController" : {
      "rbac" : {
        "serviceAccount" : {
          "create" : var.service_account_create
          "name" : "${var.service_account_name}-reports-controller"
          "annotations" : {
            "eks.amazonaws.com/role-arn" : local.irsa_role_create ? aws_iam_role.this[0].arn : ""
          }
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
