#-----------------------------------------------
# AWS IAM Policy Step Functions
#-----------------------------------------------
module "iam_policy_postgresql" {
  source = "../../modules/iam/iam_policy"

  common_config = {
    name        = var.name
    environment = var.environment
    tags        = var.tags
  }

  policy_config = {
    postgresql = {
      description     = "obtencion de secretos para postgresql ${var.name} 01"
      resource_number = "2"
      statements = [
        {
          Sid      = "1"
          Effect   = "Allow"
          Resource = ["${module.secret_manager_rds_aurora_postgres.arn}"]
          Action = [
            "secretsmanager:GetSecretValue"
          ]
          Condition = {}
        },
        {
          Sid      = "Enabled Proxy"
          Effect   = "Allow"
          Resource = ["*"]
          Action = [
              "rds:DescribeDBProxies",
              "rds:DescribeDBProxyTargets"
          ]
          Condition = {}
        },
        {
          Action = [
            "logs:CreateLogGroup",
            "logs:CreateLogStream",
            "logs:PutLogEvents",
            "logs:DescribeLogStreams"
          ],
          Condition = {},
          Effect    = "Allow",
          Resource = [
            module.cloudwatch_log_group_postgresql.arn
          ],
          Sid = "enableLogs"
        }
      ]
    }
  }
}

#-----------------------------------------------
# AWS IAM Policy appFlow
#-----------------------------------------------
module "iam_policy_lb" {
  source = "../../modules/iam/iam_policy"

  common_config = {
    name        = var.name
    environment = var.environment
    tags        = var.tags
  }

  policy_config = {
    lb = {
      description     = "Enable ecr ${var.name} 01"
      resource_number = "1"
      statements = [
        {
          Sid    = "lbPermissions"
          Effect = "Allow"
          Resource = ["*"]
          Action = [
            "ec2:DescribeSubnets",
            "ec2:DescribeSecurityGroups",
            "elasticloadbalancing:DescribeTargetGroups",
            "elasticloadbalancing:DescribeTargetHealth",
            "elasticloadbalancing:RegisterTargets",
            "elasticloadbalancing:DeregisterTargets"
          ]
          Condition = {}
        },
        {
          Sid    = "acceso a certificados"
          Effect = "Allow"
          Resource = ["arn:aws:acm:region:account-id:certificate/uuid-del-certificado"]
          Action = [
            "acm:DescribeCertificate",
            "acm:GetCertificate",
            "acm:ListCertificates"
          ]
          Condition = {}
        },
        {
          Sid    = "acceso al WAF"
          Effect = "Allow"
          Resource = ["*"]
          Action = [
            "wafv2:AssociateWebACL",
            "wafv2:DisassociateWebACL",
            "wafv2:GetWebACL"
          ]
          Condition = {}
        },
      ]
    }
  }
}

#-----------------------------------------------
# AWS IAM Role Step Functions
#-----------------------------------------------
module "iam_role_01" {
  source = "git::https://BancoPichinchaEC@dev.azure.com/BancoPichinchaEC/iac-modules/_git/mod-iac-aws//terraform/aws/iam/iam_roles?ref=master"

  common_config = {
    name        = var.name
    environment = var.environment
    tags        = var.tags
  }

  role_config = {

    middleware = {
      description     = "Enable lambda Permissions ${var.name} role 01"
      resource_number = "1"
      managed_policy_arns = [
        module.iam_policy_01.arn["middleware"]
      ]

      statements = [
        {
          Sid    = "enableLambda"
          Effect = "Allow"
          Principal = {
            Service = "lambda.amazonaws.com"
          }
          Action = ["sts:AssumeRole"]
        }
      ]
    }

    middleware-kms = {
      description     = "Enable KMS Permissions ${var.name} role 02"
      resource_number = "2"
      statements = [
        {
          Sid    = "enableRolKMS"
          Effect = "Allow"
          Principal = {
            Service = "ecr.amazonaws.com"
          }
          Action = ["sts:AssumeRole"]
        }
      ]
    }
  }
}

#-----------------------------------------------
# AWS IAM Role APPFLOW
#-----------------------------------------------
module "iam_role_appflow_01" {
  source = "git::https://BancoPichinchaEC@dev.azure.com/BancoPichinchaEC/iac-modules/_git/mod-iac-aws//terraform/aws/iam/iam_roles?ref=master"

  common_config = {
    name        = var.name
    environment = var.environment
    tags        = var.tags
  }

  role_config = {

    appflow = {
      description     = "Enable appFlow permisions ${var.name} role 01"
      resource_number = "1"
      managed_policy_arns = [
        module.iam_policy_appflow_01.arn["appflow"]
      ]

      statements = [
        {
          Sid    = "enableAppFlow"
          Effect = "Allow"
          Principal = {
            Service = "appflow.amazonaws.com"
          }
          Action = ["sts:AssumeRole"]
        }
      ]
    }
  }
}
