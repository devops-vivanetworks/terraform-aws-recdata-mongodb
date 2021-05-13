locals {
  service_name   = "recdata"
  product_domain = "rec"
  application    = "mongodb-3.6"

  ebs_volume_ids = [
    "${module.recdata_volume_mongodb_01.volume_id}",
    "${module.recdata_volume_mongodb_02.volume_id}",
    "${module.recdata_volume_mongodb_03.volume_id}"
  ]

  instance_names = [
    "${module.mongodb_cluster.instance_name_node_01}",
    "${module.mongodb_cluster.instance_name_node_02}",
    "${module.mongodb_cluster.instance_name_node_03}"
  ]

  instance_ips = [
    "${module.mongodb_cluster.instance_private_ip_node_01}",
    "${module.mongodb_cluster.instance_private_ip_node_02}",
    "${module.mongodb_cluster.instance_private_ip_node_03}"
  ]
}
