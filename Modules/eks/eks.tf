resource "aws_iam_role" "eks" {
    name = "${var.Environment}-${var.eks_name}-eks-cluster"

    assume_role_policy =  <<-POLICY
{
  "Version": "2012-10-17",
  "Statement": {
    "Sid": "AssumeRolePolicyeks1",
    "Effect": "Allow",
    "Principal": { "Service": "eks.amazonaws.com" },
    "Action": "sts:AssumeRole"
  }
}
POLICY
}

resource "aws_iam_role_policy_attachment" "eks" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role = aws_iam_role.eks.name
}

resource "aws_eks_cluster" "this" {
  name = "${var.Environment}-${var.eks_name}"
  version = var.eks_version
  role_arn = aws_iam_role.eks.arn

  vpc_config {
    endpoint_private_access = false
    endpoint_public_access = true
    subnet_ids = var.private_web_subnets
  }

  depends_on = [aws_iam_role_policy_attachment.eks]  
}
