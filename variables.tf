variable "name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "ami" {
  type = string
}

variable "is_spot_instance" {
  type    = bool
  default = false
}

variable "security_group_ids" {
  type    = list(string)
  default = null
}

variable "subnet_id" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "root_block_device" {
  type    = map(any)
  default = {}
}

variable "associate_eip" {
  description = "Whether an elastic IP is created for the instance or not"
  type        = bool
  default     = false
}

variable "instance_profile_role" {
  type        = string
  description = "The name of the IAM role to attach to the instance profile"
  default     = null
}

variable "user_data" {
  type        = string
  description = "Rendered user_data script, as a string"
  default     = null
}
