module "s3_backend" {
  source      = "./modules/s3-backend"
  bucket_name = "hw-goit-leskovets-bucket"
  table_name  = "terraform-locks"
  aws_region  = "eu-west-2"
}

module "vpc" {
  source             = "./modules/vpc"
  vpc_cidr_block     = var.vpc_cidr_block
  public_subnets     = var.public_subnets
  private_subnets    = var.private_subnets
  availability_zones = var.availability_zones
  vpc_name           = var.vpc_name
  aws_region         = var.aws_region
}

module "ecr" {
  source       = "./modules/ecr"
  ecr_name     = var.ecr_name
  scan_on_push = var.ecr_scan_on_push
  aws_region   = var.aws_region
}