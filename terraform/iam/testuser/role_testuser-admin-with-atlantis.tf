# #
# # testuser administrator
# #
# resource "aws_iam_role" "atlantis_testuser_admin" {
#   name = "atlantis-testuser-admin"
#   path = "/"

#   assume_role_policy = jsonencode({
#     "Version" : "2012-10-17",
#     "Statement" : [
#       {
#         "Sid" : "",
#         "Effect" : "Allow",
#         "Principal" : {
#           "AWS" : [
#             "arn:aws:iam::${var.account_id.id}:role/atlantis-ecs_task_execution"
#           ]
#         },
#         "Action" : "sts:AssumeRole"
#       }
#     ]
#   })

# }

# resource "aws_iam_role_policy" "atlantis_testuser_admin" {
#   name = "atlantis-testuser-admin-passrole"
#   role = aws_iam_role.atlantis_testuser_admin.id

#   policy = jsonencode({
#     "Statement" : [
#       {
#         "Sid" : "AllowIAMPassRole",
#         "Action" : [
#           "iam:PassRole"
#         ],
#         "Effect" : "Allow",
#         "Resource" : "*"
#       }
#     ]
#   })

# }

# resource "aws_iam_role_policy_attachment" "atlantis_testuser_admin" {
#   role       = aws_iam_role.atlantis_testuser_admin.id
#   policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
# }
