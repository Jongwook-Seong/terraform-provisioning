module "sops_testuser" {
  source = "../_modules/sops"
  name   = "testuser"
  allowed_arns_for_common = [
    "arn:aws:iam::${var.account_id.id}:root",
    "arn:aws:iam::${var.account_id.id}:role/atlantis-ecs_task_execution"
  ]
  allowed_arns_for_secure = [
    "arn:aws:iam::${var.account_id.id}:root",
    "arn:aws:iam::${var.account_id.id}:role/atlantis-ecs_task_execution"
  ]
}

output "sops_testuser_common_role_arn" {
  value = module.sops_testuser.common_role_arn
}

output "sops_testuser_secure_role_arn" {
  value = module.sops_testuser.secure_role_arn
}
