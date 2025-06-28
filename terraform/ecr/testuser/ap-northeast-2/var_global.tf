variable "assume_role_arn" {
  description = "The role to assume when accessing the AWS API."
  default     = ""
}

# Atlantis user
variable "atlantis_user" {
  description = "The username that will be triggering atlantis commands. This will be used to name the session when assuming a role. More information - https://github.com/runatlantis/atlantis#assume-role-session-names"
  default     = "atlantis_user"
}

# Account IDs
# Add all account ID to here 
variable "account_id" {
  default = {
    id        = "573644187329"
    art-id    = "816736805842"
    # datadog   = "464622532012"
    # sumologic = "926226587429"
  }
}

# Remote State that will be used when creating other resources
# You can add any resource here, if you want to refer from others
variable "remote_state" {
  default = {
    vpc = {
      jwsd_apnortheast2 = {
        bucket = "testuser-apnortheast2-tfstate"
        key    = "provisioning/terraform/vpc/jwsd_apnortheast2/terraform.tfstate"
        region = "ap-northeast-2"
      }
    }
    iam = {
      testuser = {
        bucket = "testuser-apnortheast2-tfstate"
        key    = "provisioning/terraform/iam/testuser/terraform.tfstate"
        region = "ap-northeast-2"
      }
    }

    kms = {
      testuser = {
        apne2 = {
          bucket = "testuser-apnortheast2-tfstate"
          key    = "provisioning/terraform/kms/testuser/ap-northeast-2/terraform.tfstate"
          region = "ap-northeast-2"
        }
      }
    }

    ecs = {
      nginx = {
        jwsdapne2 = {
          bucket = "testuser-apnortheast2-tfstate"
          key    = "provisioning/terraform/ecs/nginx/jwsd_apnortheast2/terraform.tfstate"
          region = "ap-northeast-2"
        }
      }
      demo = {
        jwsdapne2 = {
          bucket = "testuser-apnortheast2-tfstate"
          key    = "provisioning/terraform/ecs/demo/jwsd_apnortheast2/terraform.tfstate"
          region = "ap-northeast-2"
        }
      }
    }

    security_group = {
      testuser = {
        jwsdapne2 = {
          bucket = "testuser-apnortheast2-tfstate"
          key    = "provisioning/terraform/securitygroup/testuser/jwsd_apnortheast2/terraform.tfstate"
          region = "ap-northeast-2"
        }
      }
    }

    codedeploy = {
      testuser = {
        apne2 = {
          bucket = "testuser-apnortheast2-tfstate"
          key    = "provisioning/terraform/codedeploy/ap-northeast-2/terraform.tfstate"
          region = "ap-northeast-2"
        }
      }
    }

    secretsmanager = {
      testuser = {
        apne2 = {
          bucket = "testuser-apnortheast2-tfstate"
          key    = "provisioning/terraform/secretsmanager/testuser/ap-northeast-2/terraform.tfstate"
          region = "ap-northeast-2"
        }
      }
    }

    eks = {
      jwsdapne2-nhwy = {
        bucket = "testuser-apnortheast2-tfstate"
        key    = "provisioning/terraform/eks/jwsd_apnortheast2/jwsdapne2-nhwy/terraform.tfstate"
        region = "ap-northeast-2"
      }
    }

    s3 = {
      testuser = {
        bucket = "testuser-apnortheast2-tfstate"
        key    = "provisioning/terraform/s3/testuser/terraform.tfstate"
        region = "ap-northeast-2"
      }
    }
  }
}
