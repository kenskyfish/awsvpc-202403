resource "aws_vpc" "new_vpc" {
  cidr_block = var.cidr-vpc

  tags = {
    Name = var.vpc-name
  }
}

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.new_vpc.id

  tags = {
    Name = "${var.vpc-name}-dmz"
  }
}
