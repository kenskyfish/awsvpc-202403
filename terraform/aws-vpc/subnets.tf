resource "aws_subnet" "dmz_subnet" {
  vpc_id            = aws_vpc.new_vpc.id
  cidr_block        = var.cidr-dmz
  availability_zone = "${var.aws_region}${var.aws_dmz_az}"
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.vpc-name}-dmz"
  }
}

resource "aws_subnet" "a_subnet" {
  count             = contains(var.aws_used_azs, "a") ? 1 : 0
  vpc_id            = aws_vpc.new_vpc.id
  cidr_block        = var.cidr-a
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = "${var.vpc-name}-a"
  }
}

resource "aws_subnet" "b_subnet" {
  count             = contains(var.aws_used_azs, "b") ? 1 : 0
  vpc_id            = aws_vpc.new_vpc.id
  cidr_block        = var.cidr-b
  availability_zone = "${var.aws_region}b"

  tags = {
    Name = "${var.vpc-name}-b"
  }
}

resource "aws_subnet" "c_subnet" {
  count             = contains(var.aws_used_azs, "c") ? 1 : 0
  vpc_id            = aws_vpc.new_vpc.id
  cidr_block        = var.cidr-c
  availability_zone = "${var.aws_region}c"

  tags = {
    Name = "${var.vpc-name}-c"
  }
}

resource "aws_subnet" "d_subnet" {
  count             = contains(var.aws_used_azs, "d") ? 1 : 0
  vpc_id            = aws_vpc.new_vpc.id
  cidr_block        = var.cidr-d
  availability_zone = "${var.aws_region}d"

  tags = {
    Name = "${var.vpc-name}-d"
  }
}
