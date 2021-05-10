locals {
  mongodb_volume_size = "64"
  environment         = "staging"

  hourly_retention  = "6"
  daily_retention   = "7"
  weekly_retention  = "8"
  monthly_retention = "12"
  yearly_retention  = "7"

  route53_private_zone_id = "Z32OEBZ2VZHSJZ"
}
