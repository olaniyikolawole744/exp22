terraform {
  backend "s3" {
    bucket = "dirapp-744"
    key    = var.backend_key
    region = "us-east-1"
  }
}

