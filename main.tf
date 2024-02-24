terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.34.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "demo_ec2" {
    ami      = "ami-0440d3b780d96b29d"
  instance_type = "t2.micro"
  user_data = file("install.sh")

  tags = {
    Name = "demo ec2"
  }
}
resource "aws_ebs_volume" "demo_volume" {
  availability_zone = aws_instance.demo_ec2.availability_zone
  size              = 10

  tags = {
    Name = "demo_volume"
  }
}
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.demo_volume.id
  instance_id = aws_instance.demo_ec2.id
}
output "public-ip" {
  value = aws_instance.demo_ec2.public_ip
}
output "availability_zone" {
  value = aws_instance.demo_ec2.availability_zone
}