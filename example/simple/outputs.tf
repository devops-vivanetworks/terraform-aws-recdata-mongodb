output "security_group_id" {
  description = "The ID of mongod security group"
  value       = "${module.mchdata_mongodb_example.security_group_id}"
}

output "instance_id_node_01" {
  description = "instance id for mongo node 01"
  value       = "${module.mchdata_mongodb_example.instance_id_node_01}"
}

output "instance_id_node_02" {
  description = "instance id for mongo node 02"
  value       = "${module.mchdata_mongodb_example.instance_id_node_02}"
}

output "instance_id_node_03" {
  description = "instance id for mongo node 03"
  value       = "${module.mchdata_mongodb_example.instance_id_node_03}"
}

output "instance_private_ip_node_01" {
  description = "instance private ip for node 01"
  value       = "${module.mchdata_mongodb_example.instance_private_ip_node_01}"
}

output "instance_private_ip_node_02" {
  description = "instance private ip for node 02"
  value       = "${module.mchdata_mongodb_example.instance_private_ip_node_02}"
}

output "instance_private_ip_node_03" {
  description = "instance private ip for node 03"
  value       = "${module.mchdata_mongodb_example.instance_private_ip_node_03}"
}


output "instance_availability_zone_node_01" {
  description = "instance availability zone for node 01"
  value       = "${module.mchdata_mongodb_example.instance_availability_zone_node_01}"
}

output "instance_availability_zone_node_02" {
  description = "instance availability zone for node 02"
  value       = "${module.mchdata_mongodb_example.instance_availability_zone_node_02}"
}

output "instance_availability_zone_node_03" {
  description = "instance availability zone for node 03"
  value       = "${module.mchdata_mongodb_example.instance_availability_zone_node_03}"
}

output "instance_name_node_01" {
  description = "instance name for node 01"
  value       = "${module.mchdata_mongodb_example.instance_name_node_01}"
}

output "instance_name_node_02" {
  description = "instance name for node 02"
  value       = "${module.mchdata_mongodb_example.instance_name_node_02}"
}

output "instance_name_node_03" {
  description = "instance name for node 03"
  value       = "${module.mchdata_mongodb_example.instance_name_node_03}"
}

output "route53_names" {
  description = "route53 name of the mongodb nodes"
  value       = "${module.mchdata_mongodb_example.route53_names}"
}

output "route53_fqdns" {
  description = "fqdn of the mongodb nodes"
  value       = "${module.mchdata_mongodb_example.route53_fqdns}"
}
