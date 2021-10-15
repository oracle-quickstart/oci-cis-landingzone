// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

variable "alarms" {
  description = "Alarms"
  type = map(object({
     compartment_id = string
     destinations = list(string)
     display_name = string
     is_enabled = bool
     metric_compartment_id = string
     namespace = string
     query = string
     severity = string
    }))
}
    
/*variable "topics" {
  type = map(string)
}*/