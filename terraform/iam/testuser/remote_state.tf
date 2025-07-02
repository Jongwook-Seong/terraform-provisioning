data "terraform_remote_state" "kms" {
  backend = "s3"
  #   config  = merge(var.remote_state.kms.testuser.apne2)
  config = merge(var.remote_state.kms.testuser.apne2, { "assume_role" = { "role_arn" = var.assume_role_arn } })
}

data "terraform_remote_state" "secretsmanager" {
  backend = "s3"
  #   config  = merge(var.remote_state.kms.testuser.apne2)
  config = merge(var.remote_state.secretsmanager.testuser.apne2, { "assume_role" = { "role_arn" = var.assume_role_arn } })
}


data "terraform_remote_state" "demo_jwsdapne2" {
  backend = "s3"
  #   config  = merge(var.remote_state.ecs.demo.jwsdapne2)
  config = merge(var.remote_state.ecs.demo.jwsdapne2, { "assume_role" = { "role_arn" = var.assume_role_arn } })
}


data "terraform_remote_state" "codedeploy" {
  backend = "s3"
  #   config  = merge(var.remote_state.codedeploy.testuser.apne2)
  config = merge(var.remote_state.codedeploy.testuser.apne2, { "assume_role" = { "role_arn" = var.assume_role_arn } })
}

data "terraform_remote_state" "eks" {
  backend = "s3"
  #   config  = merge(var.remote_state.eks.jwsdapne2-nhwy)
  config = merge(var.remote_state.eks.jwsdapne2-nhwy, { "assume_role" = { "role_arn" = var.assume_role_arn } })
}
