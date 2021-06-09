# LOG GROUP
module "loggroup" {
  source = "git@github.com:traveloka/terraform-aws-mongodb//modules/mongodb-loggroup?ref=v1.0.1"

  service_name   = "${local.service_name}"
  product_domain = "${local.product_domain}"
  environment    = "${var.environment}"
}

# CLUSTER
module "mongodb_cluster" {
  source                    = "git@github.com:traveloka/terraform-aws-mongodb?ref=v1.2.2"
  service_name              = "${local.service_name}"
  application               = "${local.application}"
  ebs_volume_ids            = "${local.ebs_volume_ids}"
  product_domain            = "${local.product_domain}"
  parameter_store_kms_key   = "${var.kms_key_arn}"
  instance_type             = "${var.instance_type}"
  vpc_id                    = "${var.vpc_id}"
  environment               = "${var.environment}"
  ami_id                    = "${var.ami_id}"
  description               = "mongodb cluster for recdata module"
  is_standalone             = "false"
  is_volume_backup_enabled  = "${var.is_volume_backup_enabled}"
  lambda_volume_backup_name = "${var.lambda_volume_backup_name}"
  lambda_volume_backup_arn  = "${var.lambda_volume_backup_arn}"
  log_group_arn             = "${module.loggroup.log_group_arn}"
  hourly_retention          = "${var.hourly_retention}"
  daily_retention           = "${var.daily_retention}"
  weekly_retention          = "${var.weekly_retention}"
  monthly_retention         = "${var.monthly_retention}"
  yearly_retention          = "${var.yearly_retention}"
}


# IAM Policy
resource "aws_iam_role_policy_attachment" "mongodb_cluster_ssm_policy" {
  role       = "${module.mongodb_cluster.instance_iam_role_name}"
  policy_arn = "${var.ssm_policy_arn}"
}
resource "aws_iam_role_policy_attachment" "commonEC2_attachment" {
  role       = "${module.mongodb_cluster.instance_iam_role_name}"
  policy_arn = "${var.ec2_policy_arn}"
}

# Volumes
module "recdata_volume_mongodb_01" {
  source                     = "git@github.com:traveloka/terraform-aws-mongodb//modules/mongodb-volume?ref=v1.0.1"
  mongodb_volume_size        = "${var.mongodb_volume_size}"
  product_domain             = "${local.product_domain}"
  service_name               = "${local.service_name}"
  environment                = "${var.environment}"
  availability_zone          = "${module.mongodb_cluster.instance_availability_zone_node_01}"
  volume_name                = "${module.mongodb_cluster.instance_name_node_01}"
  instance_id                = "${module.mongodb_cluster.instance_id_node_01}"
  mongodb_volume_description = "volume for recdata mongodb node 01"
  hourly_retention           = "${var.hourly_retention}"
  daily_retention            = "${var.daily_retention}"
  weekly_retention           = "${var.weekly_retention}"
  monthly_retention          = "${var.monthly_retention}"
  yearly_retention           = "${var.yearly_retention}"
}

module "recdata_volume_mongodb_02" {
  source                     = "git@github.com:traveloka/terraform-aws-mongodb//modules/mongodb-volume?ref=v1.0.1"
  mongodb_volume_size        = "${var.mongodb_volume_size}"
  product_domain             = "${local.product_domain}"
  service_name               = "${local.service_name}"
  environment                = "${var.environment}"
  availability_zone          = "${module.mongodb_cluster.instance_availability_zone_node_02}"
  volume_name                = "${module.mongodb_cluster.instance_name_node_02}"
  instance_id                = "${module.mongodb_cluster.instance_id_node_02}"  
  mongodb_volume_description = "volume for recdata mongodb node 02"
  hourly_retention           = "${var.hourly_retention}"
  daily_retention            = "${var.daily_retention}"
  weekly_retention           = "${var.weekly_retention}"
  monthly_retention          = "${var.monthly_retention}"
  yearly_retention           = "${var.yearly_retention}"  
}

module "recdata_volume_mongodb_03" {
  source                     = "git@github.com:traveloka/terraform-aws-mongodb//modules/mongodb-volume?ref=v1.0.1"
  mongodb_volume_size        = "${var.mongodb_volume_size}"
  product_domain             = "${local.product_domain}"
  service_name               = "${local.service_name}"
  environment                = "${var.environment}"
  availability_zone          = "${module.mongodb_cluster.instance_availability_zone_node_03}"
  volume_name                = "${module.mongodb_cluster.instance_name_node_03}"
  instance_id                = "${module.mongodb_cluster.instance_id_node_03}"
  mongodb_volume_description = "volume for recdata mongodb node 03"
  hourly_retention           = "${var.hourly_retention}"
  daily_retention            = "${var.daily_retention}"
  weekly_retention           = "${var.weekly_retention}"
  monthly_retention          = "${var.monthly_retention}"
  yearly_retention           = "${var.yearly_retention}"
}


# Volumes Attachment
resource "aws_volume_attachment" "mongodb_volume_01_attachment" {
  volume_id   = "${module.recdata_volume_mongodb_01.volume_id}"
  instance_id = "${module.mongodb_cluster.instance_id_node_01}"
  device_name = "/dev/sdf"
}

resource "aws_volume_attachment" "mongodb_volume_02_attachment" {
  volume_id   = "${module.recdata_volume_mongodb_02.volume_id}"
  instance_id = "${module.mongodb_cluster.instance_id_node_02}"
  device_name = "/dev/sdf"
}

resource "aws_volume_attachment" "mongodb_volume_03_attachment" {
  volume_id   = "${module.recdata_volume_mongodb_03.volume_id}"
  instance_id = "${module.mongodb_cluster.instance_id_node_03}"
  device_name = "/dev/sdf"
}

# Security Groups
resource "aws_security_group_rule" "allow_ingress_from_mongodb_cluster_to_itself_at_27017" {
  type              = "ingress"
  from_port         = "27017"
  to_port           = "27017"
  protocol          = "TCP"
  security_group_id = "${module.mongodb_cluster.security_group_id}"
  self              = "true"
}

resource "aws_security_group_rule" "allow_egress_from_mongodb_cluster_to_itself_at_27017" {
  type              = "egress"
  from_port         = "27017"
  to_port           = "27017"
  protocol          = "TCP"
  security_group_id = "${module.mongodb_cluster.security_group_id}"
  self              = "true"
}

resource "aws_security_group_rule" "allow_egress_from_mongodb_cluster_to_all_at_80" {
  type              = "egress"
  from_port         = "80"
  to_port           = "80"
  protocol          = "TCP"
  security_group_id = "${module.mongodb_cluster.security_group_id}"
  cidr_blocks       = ["0.0.0.0/0"]
}

resource "aws_security_group_rule" "allow_egress_from_mongodb_cluster_to_all_at_443" {
  type              = "egress"
  from_port         = "443"
  to_port           = "443"
  protocol          = "TCP"
  security_group_id = "${module.mongodb_cluster.security_group_id}"
  cidr_blocks       = ["0.0.0.0/0"]
}

# ROUTE53
resource "aws_route53_record" "mongod" {
  zone_id = "${var.route53_private_zone_id}"
  name    = "${element(local.instance_names, count.index)}"
  type    = "A"
  ttl     = "300"

  records = [
    "${element(local.instance_ips, count.index)}",
  ]

  count = "4"
}
