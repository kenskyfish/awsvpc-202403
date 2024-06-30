resource "aws_instance" "test_instance" {
  ami           = var.test_ami
  instance_type = var.test_instance_type
  subnet_id     = aws_subnet.a_subnet[0].id
  vpc_security_group_ids = [aws_security_group.local_only.id, aws_security_group.all_out.id]
  key_name = var.aws_keypair_name
  tags = {
    Name = "Test Instance"
  }
}