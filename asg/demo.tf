provider "aws" {
   region = "us-east-2"
  access_key = "AKIAJ5LVOVQWY6VBKOYQ"
  secret_key = "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"
}

terraform {
  backend "s3" {
    bucket = "asgbucket"
    key    = "asg01/terraform.tfstate"
    region = "us-east-2"
  }
}

resource "aws_launch_configuration" "asc_01" {
  name = "asc-1"
  image_id = "${var.amiid}"
  security_groups = ["sg-0f9ec7fa1b699ae0e"]
  instance_type = "t2.micro"
  #user_data = "${file("user-data.txt")}"
}

resource "aws_autoscaling_group" "asg_01" {
  name                 = "asg_tf_01"
  max_size = "${var.max_count}"
  min_size = "${var.min_count}"
  desired_capacity ="${var.desired_count}"
  health_check_grace_period = "${var.hc_grace_period}"
  launch_configuration = "${aws_launch_configuration.asc_01.name}"
  wait_for_capacity_timeout = "${var.cap_timeout}"
  vpc_zone_identifier       = ["${var.subnet1}", "${var.subnet2}"]
}

output "AutoScalinggroupID" {
  value = "${aws_autoscaling_group.asg_01.id}"
}

output "AutoScalingLaunchConfigID" {
  value = "${aws_launch_configuration.asc_01.id}"
}


output "EndoftheScript" {
  value = "**************"
}
