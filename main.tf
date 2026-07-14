provider "aws" {
  region = "us-east-1"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "jenkins-eks"
  cluster_version = "1.30"

  vpc_id = "vpc-0c1f5a8a24d5b7db9"

  subnet_ids = [
    "subnet-05d1b0ed4beb1e52d",
    "subnet-01e6032afcd96c6e6",
    "subnet-0640d9e3a6a360dab"
  ]

  cluster_endpoint_public_access  = true
  cluster_endpoint_private_access = true

  eks_managed_node_groups = {
    default = {
      instance_types = ["t3.medium"]

      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  }
}
