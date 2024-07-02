terraform {
  backend "s3" {
    bucket =  "databackup-terraform1"
    key    = "backend3/terraform.tfstate"
    region =  "us-east-1"
    dynamodb_table = "terraform"
  }
}
