# Copyright (c) 2020 Oracle and/or its affiliates.
# Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

module "cis_notification_idp_group_mappings_changes" {
  source             = "../modules/monitoring/notifications"
  compartment_id     = module.cis_compartments.compartments[local.security_compartment_name].id
  rule_display_name  = "${var.service_label}-notify-on-idp-group-mapping-changes"    
  rule_description   = "Sends notification when Identity Provider Group Mappings are created, updated or deleted."
  rule_is_enabled    = true
  rule_condition     = <<EOT
  {"eventType": 
    ["com.oraclecloud.identityControlPlane.CreateIdpGroupMapping",
     "com.oraclecloud.identityControlPlane.DeleteIdpGroupMapping",
     "com.oraclecloud.identityControlPlane.UpdateIdpGroupMapping"]
  }
  EOT

  rule_actions_actions_action_type = "ONS"
  rule_actions_actions_is_enabled  = true
  rule_actions_actions_description = "Sends notification via ONS"

  topic_id = module.cis_security_topic.topic_id
}  