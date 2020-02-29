variable "region" {
  default = "us-east-2"
}

variable "amiid" {
  type = map(string)
  default = {
    us-east-2 = "ami-5e8bb23b"
    us-east-1 = "ami-759bc50a"
    eu-west-1 = "ami-4aa04129"
  }
  description = "You may added more regions if you want"
}

variable "instance_count" {
  default = "1"
}

variable "key_name" {
  default     = "Kavya_AWSkey"
  description = "the ssh key to used for the EC2 instance"
}

variable "security_group" {
  default     = "sg3090d058"
  description = "Security groups for the instance"
}

