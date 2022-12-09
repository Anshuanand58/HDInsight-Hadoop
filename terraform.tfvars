resource_group_name   = "demo-RG"
location              = "Central US"
storage_account_name  = "anshustorage1999"
storage_container_name= "hdinsight"
log_analytics_workspace_name = "loganalytics-test"
  hadoop_cluster = {
    name             = "hdinsighthadoopcluster"
    cluster_version  = "4.0"
    gateway_username = "acctestusrgw"
    gateway_password = "TerrAform123!"
    hadoop_version   = "3.1"
    tier             = "Standard"
  }
roles = {
    username               = "acctestusrvm"
    password               = "AccTestvdSC4daf986!"
    head_vm_size           = "Standard_D3_V2"
    worker_vm_size         = "Standard_D4_V2"
    target_instance_count  = 3
    zoo_vm_size            = "Standard_D3_V2"  
  }