variable "environment" {
  type        = "string"
  description = "The environment this stack belongs to"
}

variable "vpc_id" {
  type        = "string"
  description = "The ID of the VPC this stack belongs to"
}

variable "lambda_volume_backup_arn" {
  description = "arn of lambda function to backup ebs volume, you need to deploy this lambda function to enable the volume backup, "
  type        = "string"
  default     = ""
}

variable "lambda_volume_backup_name" {
  description = "name of lambda function to backup ebs volume"
  type        = "string"
  default     = ""
}

variable "hourly_retention" {
  description = "number of volume backup to be retained in hourly basis"
  type        = "string"
  default     = "6"
}

variable "daily_retention" {
  description = "number of volume backup to be retained in daily basis"
  type        = "string"
  default     = "7"
}

variable "weekly_retention" {
  description = "number of volume backup to be retained in weekly basis"
  type        = "string"
  default     = "8"
}

variable "monthly_retention" {
  description = "number of volume backup to be retained in monthly basis"
  type        = "string"
  default     = "12"
}

variable "yearly_retention" {
  description = "number of volume backup to be retained in yearly basis"
  type        = "string"
  default     = "7"
}

variable "ami_id" {
  description = "Amazon Machine Image id to be used to create the instances"
  type        = "string"
}

variable "instance_type" {
  description = "EC2 instance type to use"
  type        = "string"
}

variable "ssm_policy_arn" {
  type        = "string"
  description = "SSM access policy arn to attach to instance profile"
}

variable "kms_key_arn" {
  description = "arn or kms key used to encryp and decrypt value on parameter store"
  type        = "string"
}

variable "is_volume_backup_enabled" {
  description = "whether you want to enable the volume backup or not. You need to first deploy lambda function to backup your the volume, and specify the retention policy for the backup, if enabled, this module will create cloudwatch event rule, cloudwatch event target and lambda permission to execute lambda function."
  type        = "string"
}

variable "route53_private_zone_id" {
  type        = "string"
  description = "The ID of Route 53 private zone"
}

variable "mongodb_volume_size" {
  type        = "string"
  description = "The volume size of mongodb"
}
variable "ec2_policy_arn" {
  type        = "string"
  description = "EC2 access policy arn to attach to instance profile"
}

