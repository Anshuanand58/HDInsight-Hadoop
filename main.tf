#---------------------------------------------------------
# Resource Group Creation or selection - Default is "false"
#----------------------------------------------------------
data "azurerm_resource_group" "rgrp" {
  name  = var.resource_group_name
}


data "azurerm_log_analytics_workspace" "logws" {
  count               = var.log_analytics_workspace_name != null ? 1 : 0
  name                = var.log_analytics_workspace_name
  resource_group_name = var.resource_group_name
}

#------------------------------------------------------------------
# Storage Account for hdinsight hadoop cluster - Default is "true"
#------------------------------------------------------------------

resource "random_string" "str" {
  count   = var.storage_account_name == null ? 1 : 0
  length  = 6
  special = false
  upper   = false
  keepers = {
    name = var.resource_group_name
  }
}

data "azurerm_storage_account" "storageacc" {
  name                = var.storage_account_name
  resource_group_name = var.resource_group_name
}


data "azurerm_storage_container" "container" {
  name                 = var.storage_container_name
  storage_account_name = var.storage_account_name
}
#---------------------------------------------------------------
# hdinsight hadoop cluster - Default is "false"
#----------------------------------------------------------------

resource "azurerm_hdinsight_hadoop_cluster" "hpcluster" {
  name                = var.hadoop_cluster.name
  resource_group_name = var.resource_group_name
  location            = var.location
  cluster_version     = var.hadoop_cluster.cluster_version
  tier                = var.hadoop_cluster.tier
  component_version {
    hadoop = var.hadoop_cluster.hadoop_version
  }

  gateway {
    username = var.hadoop_cluster.gateway_username
    password = var.hadoop_cluster.gateway_password
  }
storage_account {
    storage_container_id = data.azurerm_storage_container.container.id
    storage_account_key  = data.azurerm_storage_account.storageacc.primary_access_key
    is_default           = true
  }

  roles {
    head_node {
      vm_size  = var.roles.head_vm_size
      username = var.roles.username
      password = var.roles.password
    }

    worker_node {
      vm_size               = var.roles.worker_vm_size
      username              = var.roles.username
      password              = var.roles.password
      target_instance_count = var.roles.target_instance_count
    }

    zookeeper_node {
      vm_size  = var.roles.zoo_vm_size
      username = var.roles.username
      password = var.roles.password
    }
  }
}
 