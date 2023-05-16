output "peering_id" {
  value       = var.peering_side == "Requester" ? aws_vpc_peering_connection.this[0].id : aws_vpc_peering_connection_accepter.this[0].id
  description = "Peering connection ID of the Requester or Accepter"
}