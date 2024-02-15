resource "aws_iam_role" "nodes" {
    name = "${var.Environment}-${var.eks_name}-eks-nodes"
    assume_role_policy = <<-POLICY
{
        "Version" = "2012-10-17"
        "Statement" = [{
            "Action" = "sts:AssumeRole"
            "Effect" = "Allow"
            "Principal" = {
                "Service" = "ec2.amazonaws.com"
            }
        }]
POLICY
}

resource "aws_iam_role_policy_attachment" "nodes" {
    for_each = var.node_iam_policies
    policy_arn = each.value
    role = aws_iam_role.nodes.name  
}