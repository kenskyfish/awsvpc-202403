resource "aws_eip" "vpn_eip" {
  instance = aws_instance.vpn_instance.id
  tags = {
    Name = "${var.VPC_Name} EIP"
  }
}