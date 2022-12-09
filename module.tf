module "hdinsight" {
    source = "../test"
    resource_group_name   = var.resource_group_name
    location              = var.location
    storage_account_name  = var.storage_account_name
    storage_container_name= var.storage_container_name
    log_analytics_workspace_name = var.log_analytics_workspace_name
    hadoop_cluster = {
      name             = var.hadoop_cluster.name
      cluster_version  = var.hadoop_cluster.cluster_version
      gateway_username = var.hadoop_cluster.gateway_username
      gateway_password = var.hadoop_cluster.gateway_password
      hadoop_version   = var.hadoop_cluster.hadoop_version
      tier             = var.hadoop_cluster.tier
  }
    roles = {
      username               = var.roles.username
      password               = var.roles.password
      head_vm_size           = var.roles.head_vm_size
      worker_vm_size         = var.roles.worker_vm_size 
      target_instance_count  = var.roles.target_instance_count 
      zoo_vm_size            = var.roles.zoo_vm_size 
  }
}