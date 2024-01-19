locals {
  irsa_role_create = var.enabled && var.rbac_create && var.service_account_create && var.irsa_role_create
}

# policy for image verification as per
# https://kyverno.io/blog/2023/08/18/verifying-images-in-a-private-amazon-ecr-with-kyverno-and-iam-roles-for-service-accounts-irsa/#configuring-a-kubernetes-service-account-to-assume-an-iam-role

data "aws_iam_policy_document" "this" {
  count = local.irsa_role_create && var.irsa_policy_enabled ? 1 : 0
  statement {
    actions = [
      "signer:GetSigningProfile",
      "signer:ListSigningProfiles",
      "signer:SignPayload",
      "signer:GetRevocationStatus",
      "signer:DescribeSigningJob",
      "signer:ListSigningJobs"
    ]
    resources = var.irsa_policy_ecr_repository_arns
  }
}

resource "aws_iam_policy" "this" {
  count = local.irsa_role_create && var.irsa_policy_enabled ? 1 : 0

  name        = "${var.irsa_role_name_prefix}-${var.helm_chart_name}" # tflint-ignore: aws_iam_policy_invalid_name
  path        = "/"
  description = "Policy for kyverno service"
  policy      = data.aws_iam_policy_document.this[0].json

  tags = var.irsa_tags
}

data "aws_iam_policy_document" "this_irsa" {
  count = local.irsa_role_create ? 1 : 0

  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]

    principals {
      type        = "Federated"
      identifiers = [var.cluster_identity_oidc_issuer_arn]
    }

    condition {
      test     = "StringEquals"
      variable = "${replace(var.cluster_identity_oidc_issuer, "https://", "")}:sub"

      values = [
        "system:serviceaccount:${var.namespace}:${var.service_account_name}-admission-controller",
      ]
    }

    effect = "Allow"
  }
}

resource "aws_iam_role" "this" {
  count              = local.irsa_role_create ? 1 : 0
  name               = "${var.irsa_role_name_prefix}-${var.helm_chart_name}" # tflint-ignore: aws_iam_role_invalid_name
  assume_role_policy = data.aws_iam_policy_document.this_irsa[0].json
  tags               = var.irsa_tags
}

resource "aws_iam_role_policy_attachment" "this" {
  count      = local.irsa_role_create && var.irsa_policy_enabled ? 1 : 0
  role       = aws_iam_role.this[0].name
  policy_arn = aws_iam_policy.this[0].arn
}

resource "aws_iam_role_policy_attachment" "this_additional" {
  for_each = local.irsa_role_create ? var.irsa_additional_policies : {}

  role       = aws_iam_role.this[0].name
  policy_arn = each.value
}
