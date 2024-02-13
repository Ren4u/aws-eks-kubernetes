variable "Environment" {
    description = "Environment Name"
    type = string  
}

variable "vpc_cidr_block" {
    description = "IP v4 CIDR for the VPC to be created"
    type = string
    default = "10.0.0.0/16"  
}

variable "enable_dns_support" {
  description = "setting this value to true or false will enable or disable the VPC dns support configuration"
  type = bool
  default = true
}

variable "enable_dns_hostnames" {
  description = "setting this value to true or false will enable or disable the VPC dns hostnames configuration"
  type = bool
  default = true
}

variable "availability_zones" {
    description = "A list AWS availability zones to deploy the VPC and subnets"
    type = list(string)  
}

variable "private_db_subnets" {
    description = "A list IP v4 CIDR ranges for creating subnets in each availability zones for Database deployments"
    type = list(string)
}
variable "private_web_subnets" {
    description = "A list IP v4 CIDR ranges for creating subnets in each availability zones for EKS cluster deployment"
    type = list(string)
}

variable "public_lb_subnets" {
    description = "A list IP v4 CIDR ranges for creating subnets in each availability zones for Load balancer deployment"
    type = list(string)  
}

variable "private_subnet_tags" {
    description = "Private subnet tags"
    type = map(any)  
}

variable "public_subnet_tags" {
    description = "Public subnet tags"
    type = map(any)  
}
