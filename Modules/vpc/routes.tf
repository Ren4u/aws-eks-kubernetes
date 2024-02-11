resource "aws_route_table" "App-privatesubnet-rt" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.natgw-1.id
  }

  tags = {
    Name = "App-privatesubnet-routetable"
  }
}

resource "aws_route_table" "Publicsubnet-rt" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this_igw.id
  }

  tags = {
    Name = "Publicsubnet-routetable"
  }
}

resource "aws_route_table_association" "private_subnet-association" {
  count = length(var.private_web_subnets)
  subnet_id      = aws_subnet.web_private_subnets[count.index].id
  route_table_id = aws_route_table.App-privatesubnet-rt.id
}

resource "aws_route_table_association" "public_subnet-useast1a-association" {
  count = length(var.public_lb_subnets)
  subnet_id      = aws_subnet.lb_public_subnets[count.index].id
  route_table_id = aws_route_table.Publicsubnet-rt.id
}


