terraform {
  backend "s3" {
    bucket         = "hw-goit-leskovets-bucket"
    key            = "lesson-5/terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
