provider "aws" {
  version = "1.60.0"
  region  = "ap-southeast-1"
}

module "mchdata_mongodb_example" {
  source = "../.."

  environment = "${local.environment}"
  vpc_id      = "vpc-0323ed6430adec3a4"

  ssm_policy_arn  = "arn:aws:iam::517530806209:policy/CommonSSMPolicy"
  kms_key_arn     = "arn:aws:kms:ap-southeast-1:517530806209:key/6e392cb9-6e65-4c03-ad84-2bdbd6ef4967"
  
  is_volume_backup_enabled  = "true"
  lambda_volume_backup_arn  = "arn:aws:lambda:ap-southeast-1:460124681500:function:tsiavbs_volume_backup_lambda-1dc7ae8ff875cc93"
  lambda_volume_backup_name = "tsiavbs_volume_backup_lambda-1dc7ae8ff875cc93"

  hourly_retention  = "${local.hourly_retention}"
  daily_retention   = "${local.daily_retention}"
  weekly_retention  = "${local.weekly_retention}"
  monthly_retention = "${local.monthly_retention}"
  yearly_retention  = "${local.yearly_retention}"

  ami_id        = "ami-05784e6ed4771589b"
  instance_type = "t2.medium"

  route53_private_zone_id   = "${local.route53_private_zone_id}"
  mongodb_volume_size       = "${local.mongodb_volume_size}"
}
