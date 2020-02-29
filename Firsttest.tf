provider "aws" {
  profile = "default"
  region  = "us-east-2"
}

#Request a spot instance at $0.01
resource "aws_spot_instance_request" "Spotinst" {
  ami           = "ami-00ba7707ac0ac50bb"
  spot_price    = "0.01"
  instance_type = "c4.xlarge"

  tags = {
    Name = "Spotinst"
  }
}

resource "aws_security_group" "ssh" {
  name        = "allow_ssh"
  description = "Allow ssh inbound traffic"
  vpc_id      = "vpc-12345678"

  ingress {
    # ssh
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = "24.242.16.29/32"
  }

  tags = {
    Name = "allow_all"
  }
}
