provider "aws" {
  region = "us-east-1"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "jenkins-eks"
  cluster_version = "1.30"

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  vpc_id = "vpc-0c1f5a8a24d5b7db9"

  subnet_ids = [
    "subnet-05d1b0ed4beb1e52d",
    "subnet-0578187ade4c3b1db"
  ]

  eks_managed_node_groups = {
    default = {
      instance_types = ["t3.medium"]

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }
}
