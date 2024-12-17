variable "name" {
  description = "The resource group name"
  type        = string
}

variable "location" {
  description = "The resource group location"
  type        = string
}

variable "tags" {
  description = "Resource tags"
  type        = map(string)
  default     = {}
}