resource "aws_internet_gateway" "this_igw" {
  vpc_id = aws_vpc.this.id
  tags = {
    "Name" = "Production_igw"
  }
}