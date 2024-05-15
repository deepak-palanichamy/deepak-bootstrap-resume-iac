resource "aws_s3_bucket" "sample_terraform_bucket" {
  bucket        = var.sample_terraform_bucket_name_var
  force_destroy = true
  provider      = aws.breezeware_demo
}

data "aws_iam_policy_document" "sample_terraform_bucket_policy_doc" {
  statement {
    sid       = "AllowPublicAccess"
    actions   = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.sample_terraform_bucket.arn}/*"]
    principals {
      identifiers = ["*"]
      type        = "*"
    }
  }
  provider = aws.breezeware_demo
}

resource "aws_s3_bucket_policy" "sample_terraform_bucket_policy" {
  bucket   = aws_s3_bucket.sample_terraform_bucket.id
  policy   = data.aws_iam_policy_document.sample_terraform_bucket_policy_doc.json
  provider = aws.breezeware_demo
}

resource "aws_s3_bucket_public_access_block" "sample_terraform_bucket_acl" {
  bucket                  = aws_s3_bucket.sample_terraform_bucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
  provider                = aws.breezeware_demo
}

resource "aws_s3_bucket_website_configuration" "sample_terraform_bucket_website_config" {
  bucket = aws_s3_bucket.sample_terraform_bucket.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "index.html"
  }
  provider = aws.breezeware_demo

}
