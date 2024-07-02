variable "aws_access_key" {
  description = "AWS access key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS secret key"
  type        = string
}

variable "region" {
  description = "The aws region."
  type        = string
  default     = "us-east-1"
}
variable "backend_bucket" {
    default = "databackup-terraform1"
  
}

variable "availability_zones_count" {
  description = "The number of AZs."
  type        = number
  default     = 2
}

variable "project" {
  description = "Name to be used on all the resources as identifier. e.g. Project name, Application name"
  # description = "Name of the project deployment."
  type = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overridden"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_bits" {
  description = "The number of subnet bits for the CIDR. For example, specifying a value 8 for this parameter will create a CIDR with a mask of /24."
  type        = number
  default     = 8
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default = {
    "Project"     = "TerraformEKS"
    "Environment" = "Development"
    "Owner"       = "Minfy"
  }
}
variable "eks_version" {
  description = "eks version"
  default = "1.29"
  
}
variable "addon_version" {
    description = "addon version"
    default = "v1.7.0-eksbuild.1"
  
}

############ALARM variables##########
variable "time_periods" {
  description = "The period of the metric alarm"
  type        = number
  default     = 300
}

variable "evaluate_period" {
  description = "The number of periods over which data is compared to the specified threshold"
  type        = number
  default     = 5
}

variable "threshold_value" {
  description = "The threshold value for the metric alarm"
  type        = number
  default     = 10
}
variable "sns-email" {
    default = "ankitanagarale1009@gmail.com"
  
}

############addon variables##########
variable "addons" {
  type = list(object({
    name    = string
    version = string
  }))

  default = [
    {
      name    = "amazon-cloudwatch-observability"
      version = "v1.7.0-eksbuild.1"
    }
  ]
}
