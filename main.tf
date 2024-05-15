resource "aws_s3_bucket" "sample_terraform_bucket" {
  force_destroy = true
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
}

resource "aws_s3_bucket_policy" "sample_terraform_bucket_policy" {
  bucket = aws_s3_bucket.sample_terraform_bucket.id
  policy = data.aws_iam_policy_document.sample_terraform_bucket_policy_doc.json
}

resource "aws_s3_bucket_public_access_block" "sample_terraform_bucket_acl" {
  bucket = aws_s3_bucket.sample_terraform_bucket.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_website_configuration" "sample_terraform_bucket_website_config" {
  bucket = aws_s3_bucket.sample_terraform_bucket.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "index.html"
  }

}

output "sample_terraform_bucket_site_endpoint" {
  value = aws_s3_bucket_website_configuration.sample_terraform_bucket_website_config.website_endpoint
}
