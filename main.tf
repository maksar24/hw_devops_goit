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

module "eks" {
  source               = "./modules/eks"
  cluster_name         = var.cluster_name
  public_subnet_ids    = module.vpc.public_subnet_ids
  private_subnet_ids   = module.vpc.private_subnet_ids
  node_group_desired_capacity = var.node_group_desired_capacity
  tags                 = var.tags
}

module "jenkins" {
  source = "./modules/jenkins"

  cluster_name        = module.eks.cluster_name
oidc_provider_arn  = module.eks.oidc_provider_arn
oidc_provider_url  = module.eks.oidc_provider_url
}

module "argo_cd" {
  source          = "./modules/argo_cd"
  cluster_name    = module.eks.cluster_name
  namespace       = "argocd"
  chart_version   = "5.41.1"
  repo_url        = "https://github.com/maksar24/hw_devops_goit.git"
  oidc_provider_arn = module.eks.oidc_provider_arn
  oidc_provider_url = module.eks.oidc_provider_url
}

module "rds" {
  source = "./modules/rds"

  name       = "app-db"
  use_aurora = false

  subnet_private_ids = module.vpc.private_subnet_ids
  subnet_public_ids  = module.vpc.public_subnet_ids
  vpc_id             = module.vpc.vpc_id

  publicly_accessible  = false

  engine         = "postgres"
  engine_version = "14.17"
  instance_class = "db.t3.micro"
  multi_az       = false

  db_name  = "appdb"
  username = "dbuser"
  password = "secret123"

  tags = {
    Environment = "dev"
  }
}
