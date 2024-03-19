resource "aws_default_route_table" "main_route" {
  default_route_table_id = aws_vpc.new_vpc.default_route_table_id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = ""
      egress_only_gateway_id     = ""
      instance_id                = aws_instance.nat_instance.id
      ipv6_cidr_block            = ""
      nat_gateway_id             = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_peering_connection_id  = ""
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      local_gateway_id           = ""
      vpc_endpoint_id            = ""
    }
  ]

  tags = {
    Name = "${var.vpc-name}-main"
  }
}

/* resource "aws_main_route_table_association" "main_route" {
  vpc_id         = aws_vpc.new_vpc.id
  route_table_id = aws_route_table.main_route.id
} */

resource "aws_route_table" "dmz_route" {
  vpc_id = aws_vpc.new_vpc.id

  route = [
    {
      cidr_block                 = "0.0.0.0/0"
      gateway_id                 = aws_internet_gateway.ig.id
      egress_only_gateway_id     = ""
      instance_id                = ""
      ipv6_cidr_block            = ""
      nat_gateway_id             = ""
      network_interface_id       = ""
      transit_gateway_id         = ""
      vpc_peering_connection_id  = ""
      carrier_gateway_id         = ""
      destination_prefix_list_id = ""
      local_gateway_id           = ""
      vpc_endpoint_id            = ""
    }
  ]

  tags = {
    Name = "${var.vpc-name}-dmz"
  }
}

resource "aws_route_table_association" "dmz_route" {
  subnet_id      = aws_subnet.dmz_subnet.id
  route_table_id = aws_route_table.dmz_route.id
}
