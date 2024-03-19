resource "aws_instance" "nat_instance" {
  ami           = var.nat_ami
  instance_type = var.nat_instance_type
  subnet_id     = aws_subnet.dmz_subnet.id
  source_dest_check = false
  // vpc_security_group_ids = ["sg-069a9aa8c2a00931f", "sg-0484b52a2335faf59"]
  // key_name = var.key_name // NAT doesn't need key, can use default key?
  tags = {
    Name = "${var.VPC_Name} NAT"
  }
}
