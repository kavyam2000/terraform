provider "aws" {
  region                  = "us-east-2"
 # shared_credentials_file = "/home/ubuntu/.aws/credentials"
  profile                 = "default"
}

resource "aws_s3_bucket" "asgkk01" {
  bucket = "asgbucket-kk"
  acl    = "public-read"
  #region = "us-east-2"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "Test 01"
    Environment = "Public Bucket for Test"
  }
}


output "SBucketid" {
     value = "${aws_s3_bucket.asgkk01.id}"
}
