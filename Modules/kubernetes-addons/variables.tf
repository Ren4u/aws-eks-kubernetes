variable "Environment" {
  description = "Environment name"
  type = string
}

variable "eks_name" {
  description = "Name of teh Cluster"
  type = string
}

variable "enable_cluster_autoscaler" {
  description = "Flag to enable cluster autoscaler"
  type = bool
}

variable "cluster_autoscaler_helm_version" {
  description = "Cluster Autoscaler Helm version"
  type = string
}

variable "openid_provider_arn" {
  description = "IAM Openid Connect Provider ARN"
  type = string
}