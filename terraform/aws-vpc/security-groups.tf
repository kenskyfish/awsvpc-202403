resource "aws_network_interface_sg_attachment" "nat_all_out" {
  security_group_id    = aws_security_group.all_out.id
  network_interface_id = aws_instance.nat_instance.primary_network_interface_id
}

resource "aws_network_interface_sg_attachment" "nat_local_only" {
  security_group_id    = aws_security_group.local_only.id
  network_interface_id = aws_instance.nat_instance.primary_network_interface_id
}

resource "aws_security_group" "all_out" {
  name        = "${var.vpc-name}-all-out"
  description = "Allow all outbound traffic"
  vpc_id      = aws_vpc.new_vpc.id

  ingress = []

  egress = [
    {
      description = "Everything outbound"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = null
      prefix_list_ids = null
      security_groups = null
      self = null
    }
  ]
}

resource "aws_security_group" "https_in" {
  name        = "${var.vpc-name}-https-in"
  description = "Allow in HTTPS for VPN"
  vpc_id      = aws_vpc.new_vpc.id

  ingress = [
    {
      description = "HTTPS from anywhere"
      from_port   = 443
      to_port     = 443
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      // ipv6_cidr_blocks = ["::/0"]
      ipv6_cidr_blocks = null
      prefix_list_ids = null
      security_groups = null
      self = null
    }
  ]

  egress = []
}

resource "aws_security_group" "ssh_in" {
  name        = "${var.vpc-name}-ssh-in"
  description = "Allow in SSH for VPN"
  vpc_id      = aws_vpc.new_vpc.id

  ingress = [
    {
      description = "ssh from anywhere"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
      // ipv6_cidr_blocks = ["::/0"]
      ipv6_cidr_blocks = null
      prefix_list_ids = null
      security_groups = null
      self = null
    }
  ]

  egress = []
}

resource "aws_security_group" "local_only" {
  name        = "${var.vpc-name}-local-only"
  description = "Allow local VPC traffic only"
  vpc_id      = aws_vpc.new_vpc.id

  ingress = [
    {
      description = "Anything from local VPC"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = [aws_vpc.new_vpc.cidr_block]
      // ipv6_cidr_blocks = [aws_vpc.new_vpc.ipv6_cidr_blocks]
      ipv6_cidr_blocks = null
      prefix_list_ids = null
      security_groups = null
      self = null
    }
  ]

  egress = [
    {
      description = "Anything to local VPC"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = [aws_vpc.new_vpc.cidr_block]
      // ipv6_cidr_blocks = [aws_vpc.new_vpc.ipv6_cidr_blocks]
      ipv6_cidr_blocks = null
      prefix_list_ids = null
      security_groups = null
      self = null
    }
  ]
}

// Adopt default security group and remove rules
resource "aws_default_security_group" "default" {
  vpc_id = aws_vpc.new_vpc.id

  ingress = [ ]

  egress = [ ]
}