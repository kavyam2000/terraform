variable "region" {
  default = "us-east-2"
}
variable "amiid" {
  default = "ami-0fc20dd1da406780b"
  description = "Image Id you have created for Launch"
}
variable "env" {
  type = "string"
#  default = "test"
  description ="Value of this variable is supplied in modules calling"
}
variable "loadconfig" {
  type = "string"
#  default = "WebServerLC01"
  description ="Value of this variable is supplied in modules calling"
}
variable "min_count" {
#  default = "1"
  description = "Minimum number of instance you want to trigger"
}

variable "desired_count" {
#  default = "1"
  description = "Desired number of instance you want "
}

variable "max_count" {
#  default = "1"
  description = "Maximum number of instance you want"
}
variable "hc_grace_period"{
#  default = "180"
  description = " Health Check Grace period"
}
variable "cap_timeout"{
#  default = "3m"
  description = "Capacity time out wait "
}
variable "subnet1"{
  default = "subnet-302f064a"
  description = "Subnet 1"
}
variable "instance_count" {
  default = "1"
}
variable "key_name" {
  default = "kk_awskey"
  description = "the ssh key to be used for the EC2 instance"
}

variable "security_group" {
  default = "sg-0815fe0c66a93f57"
  description = "Security groups for the instance"
}
