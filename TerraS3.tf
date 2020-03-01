# To create  S3 bucket
resource "aws_s3_bucket" "testb01" {
  bucket = "first-test-bucket-01"
  acl    = "public-read"

  versioning {
    enabled = true
  }

  tags = {
    Name        = "Test 01"
    Environment = "Public Bucket for Test"
  }
}


output "SBucketid" {
     value = "${aws_s3_bucket.testb01.id}"
}

  
