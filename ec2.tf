resource "aws_instance" "server1" {
  instance_type          = var.INSTANCE_TYPE
  user_data              = file("setup.sh")
  vpc_security_group_ids = [aws_security_group.sg-demo1.id]
  subnet_id              = aws_subnet.dio.id
  availability_zone      = "${var.INSTANCE_TYPE}a"
  ami                    = "ami-03972092c42e8c0ca"
  tags = {
    Name = var.ENVIRONMENT
  }
}

resource "aws_instance" "server2" {
  instance_type          = var.INSTANCE_TYPE
  user_data              = file("setup.sh")
  vpc_security_group_ids = [aws_security_group.sg-demo1.id]
  subnet_id              = aws_subnet.private2.id
  availability_zone      = "us-east-1b"
  ami                    = "ami-03972092c42e8c0ca"
  tags = {
    Name = "web2"
  }
}