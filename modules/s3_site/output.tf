output "sample_terraform_bucket_site_endpoint" {
  description = "value of the website endpoint"
  value       = aws_s3_bucket_website_configuration.sample_terraform_bucket_website_config.website_endpoint
}