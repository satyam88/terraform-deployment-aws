terraform {
  backend "s3" {
    bucket = "terraform-dev-airinidia-s3"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}