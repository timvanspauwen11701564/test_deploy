provider "aws" {
  region = "us-west-2"
}
 
data "aws_ami" "aws-linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn-ami-hvm*"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
 
resource "aws_instance" "helloworld" {
    ami = data.aws_ami.aws-linux.id
    instance_type = "t2.micro"
}