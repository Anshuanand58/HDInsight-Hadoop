variable "resource_group_name" {
  description = "A container that holds related resources for an Azure solution"
  default     = ""
}

variable "location" {
  description = "The location/region to keep all your network resources. To get the list of all locations with table format from azure cli, run 'az account list-locations -o table'"
  default     = ""
}

variable "storage_account_name" {
  description = "The name of the storage account"
  default     = null
}

variable "storage_container_name" {
  description = "The name of the storage container"
  default     = null
}


variable "hdinsight_cluster_type" {
  description = "The type of hdinsight cluster. Valid values are `hadoop`, `hbase`, `interactive-query`, `kafka`, `spark`."
  default     = "hadoop"
}

variable "hadoop_cluster" {
  type = object({
    name             = string
    cluster_version  = string
    tier             = string
    tls_min_version  = optional(string)
    hadoop_version   = string
    gateway_username = string
    gateway_password = string
  })
  description = "Manages a HDInsight Hadoop Cluster"
  default     = null
}
variable "roles" {
    type = object({
       username              = string
       password              = string
       head_vm_size          = string
       worker_vm_size        = string
       target_instance_count = number
       zoo_vm_size           = string
    })  
}
variable "log_analytics_workspace_name" {
    type = string
    default = ""
}
