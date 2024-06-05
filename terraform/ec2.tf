data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_security_group" "SSH_Studies" {
  name = "SSH_Studies"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "HTTP_Studies" {
  name = "HTTP_Studies"
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "nginx" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  tags = var.tags
  key_name = var.key_name
  security_groups = [aws_security_group.SSH_Studies.name, "default", aws_security_group.HTTP_Studies.name]
  user_data = "${file("scripts/init.sh")}"
}

resource "aws_eip" "nginx" {
  instance = aws_instance.nginx.id
  domain   = "vpc"
}
