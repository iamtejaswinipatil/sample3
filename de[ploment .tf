provider "aws" {
  region     = "ap-south-1"
  access_key = "AKIAQ3EGSNTWLHINZIFA"
  secret_key = "cMUb4Hf94J39T02b+lm6xgNxKyr0ZXI4/04dMWXS"
}

resource "aws_instance" "example-1" {
  ami             = "ami-08ee1453725d19cdb"
  instance_type   = "t2.micro"
  key_name        = "devill"
  count           = "1"
  tags = {
    Name = "task-1"
  }
  security_groups = [aws_security_group.example_sg.name]
  user_data = file("sample.sh")
}
resource "aws_security_group" "example_sg" {
  tags = {
  Name = "securityexample"
  }
ingress {
         from_port   = 0
         to_port     = 0
         protocol    = "-1"
         cidr_blocks = ["0.0.0.0/0"]
        }
egress {
        from_port    = 0
        to_port      = 0
        protocol     = "-1"
        cidr_blocks  = ["0.0.0.0/0"]
       }
}
#!/bin/bash

yum update -y
yum install httpd git -y
systemctl start httpd
systemctl enable httpd

cd/var/www/html/
git clone https://github.com/iamtejaswinipatil/aws3.git.
systemctl restart httpd
