######################################## PEERING CONNECTION #############################################

locals {
  rtb_ids = length(var.route_table_ids) == 0 ? data.aws_route_tables.rts.ids : var.route_table_ids
}

data "aws_route_tables" "rts" {
  vpc_id = var.vpc_id
}

resource "aws_vpc_peering_connection" "this" {
  
  count = var.peering_side == "Requester" ? 1 : 0

  vpc_id        = var.vpc_id
  peer_vpc_id   = var.peer_vpc_id
  peer_owner_id = var.peer_vpc_account_id
  auto_accept   = var.auto_accept
  peer_region   = var.peer_region

  tags = {
    Side = "Requester"
    Name = var.name
  }
}

resource "aws_route" "this" {

  count = length(local.rtb_ids)

  route_table_id            = local.rtb_ids[count.index]
  destination_cidr_block    = var.vpc_cidr_block
  vpc_peering_connection_id = var.peering_side == "Requester" ? aws_vpc_peering_connection.this[0].id : var.peering_id
}

resource "aws_vpc_peering_connection_accepter" "this" {

  count = var.peering_side == "Accepter" ? 1 : 0

  vpc_peering_connection_id = var.peering_id
  auto_accept               = var.auto_accept

  tags = {
    Side = "Accepter"
    Name = var.name
  }
}