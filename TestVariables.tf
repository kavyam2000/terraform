provider "aws" {
  alias  = "Testvariable"
  region = "us-east-2"
}

//  Ec2 instance ...
resource "aws_instance" "kavyam" {
  ami                    = var.amiid[var.region] // all the name starting with "var." will lookup for the values in variables.tf file
  instance_type          = "t2.micro"
  count                  = var.instance_count
  vpc_security_group_ids = [var.security_group]
  tags = {
    Name = "terraformInst--${count.index + 1}"
  }

  key_name  = var.key_name
  user_data = file("user_data.txt")
}

