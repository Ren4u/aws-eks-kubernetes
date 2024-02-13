resource "aws_eip" "natgwpublicip" {
  domain = "vpc"
  tags = {
    Name = "${var.Environment}-natgw1ip"
  }
}

resource "aws_nat_gateway" "natgw-1" {
  allocation_id = aws_eip.natgwpublicip.id
  subnet_id     = aws_subnet.lb_public_subnets[0].id
  tags = {
    Name = "${var.Environment}-natgw1"
  }

  depends_on = [aws_internet_gateway.this_igw]

}