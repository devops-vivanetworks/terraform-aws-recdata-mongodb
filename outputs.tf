output "security_group_id" {
  description = "security group id for mongo cluster"
  value       = "${module.mongodb_cluster.security_group_id}"
}

output "instance_iam_role_arn" {
  description = "arn of instance role"
  value       = "${module.mongodb_cluster.instance_iam_role_arn}"
}

output "instance_iam_role_name" {
  description = "name of instance role"
  value       = "${module.mongodb_cluster.instance_iam_role_name}"
}

output "instance_profile_arn" {
  description = "arn of instance profile"
  value       = "${module.mongodb_cluster.instance_profile_arn}"
}

output "instance_profile_name" {
  description = "name of instance profile"
  value       = "${module.mongodb_cluster.instance_profile_name}"
}

output "instance_id_node_01" {
  description = "instance id for mongo node 01"
  value       = "${module.mongodb_cluster.instance_id_node_01}"
}

output "instance_id_node_02" {
  description = "instance id for mongo node 02"
  value       = "${module.mongodb_cluster.instance_id_node_02}"
}

output "instance_id_node_03" {
  description = "instance id for mongo node 03"
  value       = "${module.mongodb_cluster.instance_id_node_03}"
}


output "instance_private_ip_node_01" {
  description = "instance private ip for node 01"
  value       = "${module.mongodb_cluster.instance_private_ip_node_01}"
}

output "instance_private_ip_node_02" {
  description = "instance private ip for node 02"
  value       = "${module.mongodb_cluster.instance_private_ip_node_02}"
}

output "instance_private_ip_node_03" {
  description = "instance private ip for node 03"
  value       = "${module.mongodb_cluster.instance_private_ip_node_03}"
}


output "instance_availability_zone_node_01" {
  description = "instance availability zone for node 01"
  value       = "${module.mongodb_cluster.instance_availability_zone_node_01}"
}

output "instance_availability_zone_node_02" {
  description = "instance availability zone for node 02"
  value       = "${module.mongodb_cluster.instance_availability_zone_node_02}"
}

output "instance_availability_zone_node_03" {
  description = "instance availability zone for node 03"
  value       = "${module.mongodb_cluster.instance_availability_zone_node_03}"
}


output "instance_name_node_01" {
  description = "instance name for node 01"
  value       = "${module.mongodb_cluster.instance_name_node_01}"
}

output "instance_name_node_02" {
  description = "instance name for node 02"
  value       = "${module.mongodb_cluster.instance_name_node_02}"
}

output "instance_name_node_03" {
  description = "instance name for node 03"
  value       = "${module.mongodb_cluster.instance_name_node_03}"
}

output "route53_names" {
  description = "route53 name of the mongodb nodes"
  value       = ["${aws_route53_record.mongod.*.name}"]
}

output "route53_fqdns" {
  description = "fqdn of the mongodb nodes"
  value       = ["${aws_route53_record.mongod.*.fqdn}"]
}
