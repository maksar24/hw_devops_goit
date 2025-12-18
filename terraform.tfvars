cluster_name = "goit-hw-cluster-9379992"

node_group_desired_capacity = 2

tags = {
  Project = "goit-hw"
}

dynamodb_table_name = "terraform-locks"
s3_bucket_name      = "hw-goit-leskovets-bucket"

ecr_repository_url = "685873929524.dkr.ecr.eu-west-2.amazonaws.com/lesson-7-ecr"

vpc_id = "vpc-00910d1ab34ba247f"
vpc_cidr_block = "10.0.0.0/16"

public_subnet_ids = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
private_subnet_ids = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
availability_zones = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
vpc_name = "lesson-7-vpc"
aws_region = "eu-west-2"

