resource "aws_iam_role" "demo_jwsdapne2_task" {
  name               = "demo-jwsdapne2-task"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.demo_jwsdapne2_task_assume_role_document.json
}

data "aws_iam_policy_document" "demo_jwsdapne2_task_assume_role_document" {
  statement {
    effect = "Allow"
    principals {
      identifiers = [
        "ecs-tasks.amazonaws.com"
      ]
      type = "Service"
    }
    actions = [
      "sts:AssumeRole"
    ]
    condition {
      test     = "StringEquals"
      variable = "aws:SourceAccount"
      values = [
        "573644187329"
      ]
    }
    condition {
      test     = "ArnLike"
      variable = "aws:SourceArn"
      values = [
        "arn:aws:ecs:ap-northeast-2:573644187329:*"
      ]
    }
  }
}

resource "aws_iam_role_policy" "demo_kms" {
  name   = "demo-kms-decryption"
  role   = aws_iam_role.demo_jwsdapne2_task.id
  policy = data.aws_iam_policy_document.demo_kms_ssm_document.json
}

data "aws_iam_policy_document" "demo_kms_ssm_document" {
  statement {
    sid    = "AllowToDecryptKMSKey"
    effect = "Allow"
    resources = [
      data.terraform_remote_state.kms.outputs.aws_kms_key_apne2_deployment_common_arn
    ]
    actions = [
      "kms:Decrypt"
    ]
  }

  statement {
    sid    = "AllowSecretsManagerAccess"
    effect = "Allow"
    resources = [
      data.terraform_remote_state.secretsmanager.outputs.aws_secretsmanager_demo_jwsdapne2_id
    ]
    actions = [
      "secretsmanager:GetSecretValue"
    ]
  }
}

output "demo_jwsdapne2_task_arn" {
  value = aws_iam_role.demo_jwsdapne2_task.arn
}
