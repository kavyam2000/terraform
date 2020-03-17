provider "aws" {
   region = "us-east-2"
}

#This code is needed in the calling module.
terraform {
  backend "s3" {
    bucket = "firstbucket-kk"
    key    = "asgMod/prod/terraform.tfstate"
    region = "us-east-2"
  }
}


#resource "aws_autoscaling_group" "my_asg_01" {
module  "PROD-ASG-01" {
  source = "../../modules/asg"
  env    = "${var.env}"
  max_count = "${var.max_count}"
  min_count = "${var.min_count}"
  desired_count = "${var.desired_count}"
  hc_grace_period = "${var.hc_grace_period}"
  loadconfig = "${var.loadconfig}"
  cap_timeout = "${var.cap_timeout}"
  subnet1 = "${var.subnet1}"

}


