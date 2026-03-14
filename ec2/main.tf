resource "aws_instance" "web" {

  count = length(var.subnet_ids)

  ami           = "ami-0c7217cdde317cfec"
  instance_type = "t2.micro"

  subnet_id = var.subnet_ids[count.index]

  vpc_security_group_ids = [var.security_group]

  tags = {
    Name = "web-${count.index}"
  }

}
