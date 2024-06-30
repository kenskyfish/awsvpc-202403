resource "aws_instance" "nat_instance" {
  ami           = var.nat_ami
  instance_type = var.nat_instance_type
  subnet_id     = aws_subnet.dmz_subnet.id
  source_dest_check = false
  tags = {
    Name = "${var.VPC_Name} NAT"
  }
}
