provider "aws" {
  alias   = "aws1"
  profile = "default"
  region  = "us-east-2"
}

#create a new AWS Instance
resource "aws_instance" "instance1" {
  #ami = "ami_test02262020"
  ami           = "ami-0fc20dd1da406780b"
  instance_type = "t2.micro"

  tags = {
    Name = "UnbuntuTFInst01"
  }

  key_name = "Kavya_AWSkey"
}

