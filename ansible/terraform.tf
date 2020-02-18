provider "aws" {
  profile = "default"
  access_key = ""
  secret_key = ""
  region  = "us-east-2"
}

resource "aws_key_pair" "example" {
  key_name   = "examplekey"
  public_key = file("~/.ssh/terraform.pub")
}

resource "aws_security_group" "user_sg" {
  name = "user_sg"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow outgoing traffic to anywhere.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example" {
  key_name      = aws_key_pair.example.key_name
  ami           = "ami-011566ed24db2e7a0"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.user_sg.name}"]

connection {
    type        = "ssh"
    user        = "centos"
    private_key = file("~/.ssh/terraform")
    host        = self.public_ip
  }
}
