variable "Environment" {
  description = "Environment Name"
  type = string
}

variable "eks_version" {
    description = "Desired Kubernetes master version"
    type = string  
}

variable "eks_name" {
  description = "Name of the cluster"
  type = string
}

variable "private_web_subnets" {
  description = "List of subnet IDs. Must be in at least 2 availability zones"
  type = list(string)
}

variable "node_iam_policies" {
  description = "List of IAM policies to attach to EKS-managed nodes"
  type = map(any)

  default = {
    1 = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    2 = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    3 = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    4 = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }
}

variable "node_groups" {
  description = "EKS node groups"
  type = map(any)
}

variable "enable_irsa" {
  description = "Determines whether to create an OpenID Connect Provider for EKS"
  type = bool
  default = true
}