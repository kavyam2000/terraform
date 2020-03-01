# To create  S3 bucket 

provider "aws" {
  region                  = "us-east-2"
  profile                 = "default"
}


resource "aws_s3_bucket" "testb01" {
  bucket = "First-test-bucket-01"
  acl    = "public-read"
  
  versioning {
    enabled = true
  }

  tags = {
    Name        = "Test 01"
    Environment = "Public Bucket for Test"
  }
}


output "S3 Bucket id:" {
     value = "${aws_s3_bucket.testb01.id}"
}
  
