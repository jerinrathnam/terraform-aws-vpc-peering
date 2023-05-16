variable "name" {
  type        = string
  description = "Name for the peering connection"
  default     = null
}

variable "peering_side" {
  type        = string
  description = "Enter whether the peering side is request or accept. valid values are 'Requester' and 'Accepter'"
  default     = "Requester"
}

variable "vpc_id" {
  type        = string
  description = " The ID of the requester VPC"
  default     = null
}

variable "peer_vpc_id" {
  type        = string
  description = "The ID of the VPC with which you are creating the VPC Peering Connection."
  default     = null
}

variable "peer_vpc_account_id" {
  type        = string
  description = "The AWS account ID of the owner of the peer VPC"
  default     = null
}

variable "auto_accept" {
  type        = bool
  description = "Accept the peering (both VPCs need to be in the same AWS account and region)."
  default     = false
}

variable "peer_region" {
  type        = string
  description = " The region of the accepter VPC of the VPC Peering Connection. auto_accept must be false, and use the aws_vpc_peering_connection_accepter to manage the accepter side."
  default     = null
}

variable "vpc_cidr_block" {
  type        = string
  description = "The destination CIDR block."
  default     = null
}

variable "route_table_ids" {
  type        = list(string)
  description = "List of The IDs of the routing tables. If you want add routes all the tables in a vpc, just leave it"
  default     = []
}

variable "peering_id" {
  type        = string
  description = "Peering connection id. Required only if 'peering_side' is 'Accepter'"
  default     = null
}