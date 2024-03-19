resource "aws_instance" "vpn_instance" {
  ami           = var.vpn_ami
  instance_type = var.nat_instance_type
  subnet_id     = aws_subnet.dmz_subnet.id
  // source_dest_check = false
  vpc_security_group_ids = [aws_security_group.ssh_in.id, aws_security_group.https_in.id, aws_security_group.local_only.id, aws_security_group.all_out.id]
  key_name = var.aws_keypair_name
  tags = {
    Name = "${var.VPC_Name} VPN"
  }
}
