variable "name" {
  type        = string
  description = "The name of the Management Lock. This name is used to construct the resource ID."
}

variable "resource_group_name" {
  type        = string
  description = "The name of the Resource Group where the Management Lock should be created."
}

variable "lock_level" {
  type        = string
  description = "The level of the lock. Possible values are `CanNotDelete` and `ReadOnly`."

  validation {
    condition     = contains(["CanNotDelete", "ReadOnly"], var.lock_level)
    error_message = "The lock_level must be one of the following values: `CanNotDelete`, `ReadOnly`."
  }
}

variable "subscription_id" {
  type        = string
  description = "The Subscription ID where the Resource Group resides."
}

variable "notes" {
  type        = string
  description = "Optional notes for the Management Lock."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "A map of tags to assign to the resource. Note: Azure Management Locks do not support tags via the ARM API."
  default     = {}
}