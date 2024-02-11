output "vpc_id" {
  value = aws_vpc.this.id
}

output "private_database_subnet_ids" {
  value = aws_subnet.database_private_subnets[*].id
}

output "private_web_subnet_ids" {
  value = aws_subnet.web_private_subnets[*].id
}

output "public_lb_subnet_ids" {
  value = aws_subnet.lb_public_subnets[*].id
}