/**
* Creating an S3 Bucket
**/
resource "aws_s3_bucket" "tf-bucket" {
  bucket = var.bucket_name
  acl    = "private"

  tags = {
    Name = "Terraform-S3-Example"
  }
}