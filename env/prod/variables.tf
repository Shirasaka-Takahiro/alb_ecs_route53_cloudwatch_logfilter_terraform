##General Config
variable "general_config" {
  type = map(any)
  default = {
    project = "example"
    env     = "prod"
  }
}

##Regions
variable "regions" {
  default = {
    tokyo    = "ap-northeast-1"
    virginia = "us-east-1"
  }
}

##Account ID
variable "account_id" {
  description = "AWS Account ID"
}

##Network
variable "vpc" {
  description = "CIDR BLOCK for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "availability_zones" {
  type = map(any)
  default = {
    availability_zones = {
      az-1a = {
        az = "ap-northeast-1a"
      },
      az-1c = {
        az = "ap-northeast-1c"
      }
    }
  }
}

variable "public_subnets" {
  type = map(any)
  default = {
    subnets = {
      public-1a = {
        name = "public-1a",
        cidr = "10.0.10.0/24",
        az   = "ap-northeast-1a"
      },
      public-1c = {
        name = "public-1c",
        cidr = "10.0.30.0/24",
        az   = "ap-northeast-1c"
      }
    }
  }
}

variable "dmz_subnets" {
  type = map(any)
  default = {
    subnets = {
      dmz-1a = {
        name = "dmz-1a",
        cidr = "10.0.20.0/24",
        az   = "ap-northeast-1a"
      },
      dmz-1c = {
        name = "dmz-1c",
        cidr = "10.0.40.0/24",
        az   = "ap-northeast-1c"
      }
    }
  }
}

variable "private_subnets" {
  type = map(any)
  default = {
    subnets = {
      private-1a = {
        name = "private-1a"
        cidr = "10.0.50.0/24"
        az   = "ap-northeast-1a"
      },
      private-1c = {
        name = "private-1c"
        cidr = "10.0.70.0/24"
        az   = "ap-northeast-1c"
      }
    }
  }
}

##Route53 Zone ID
variable "zone_id" {
  description = "zone id of domain"
  type        = string
  default     = ""
}

##Route53 Zone Name
variable "zone_name" {
  description = "zone name of domain"
  type        = string
  default     = ""
}

##Route53 Records
variable "sub_domain_1" {
  description = "name of sub domain"
  type        = string
  default     = "www"
}

##ECR Image Name
variable "repository_name" {
  description = "ECR repository name"
  type        = string
  default     = "ecs_terraform-image"
}

##Dockerimage Name
variable "image_name" {
  description = "Dockerimage name"
  type        = string
  default     = "takahiros991/ecs_terraform-image"
}

##Dockerfile Directory
#variable "docker_dir" {
#  description = "directory where the Dockerfile is"
#  type = string
#  default     = "."
#}

##Fargate CPU
variable "fargate_cpu" {
  description = "fargate cpu"
  type        = string
  default     = "256"
}

##Fargate Memory
variable "fargate_memory" {
  description = "fargate memory"
  type        = string
  default     = "512"
}

##SNS E-mail
variable "sns_email" {
  description = "email address for sns"
  type        = string
  default     = ""
}

##CloudWatch Log FIlter Pattern
variable "log_filter_pattern" {
  description = "log filter pattern"
  type        = string
  default     = "ERROR"
}

##CloudWatch Log FIlter Metric Transformation Value
variable "metric_transformation_value" {
  description = "log filter metric transformation value"
  type        = string
  default     = "1"
}

##Cloud Watch Alearm Actions
variable "cwa_actions" {
  description = "Cloud watch alearm actions"
  type        = string
  default     = "false"
}