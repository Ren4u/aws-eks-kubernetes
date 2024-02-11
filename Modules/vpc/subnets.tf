resource "aws_subnet" "database_private_subnets" {

  count = length(var.private_db_subnets)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_db_subnets[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = merge({"Name" = "${var.Environment}-database-${var.availability_zones[count.index]}"},
  var.private_subnet_tags)
}

resource "aws_subnet" "web_private_subnets" {

  count = length(var.private_web_subnets)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_web_subnets[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = merge({"Name" = "${var.Environment}-web-${var.availability_zones[count.index]}"},
  var.private_subnet_tags)
}

resource "aws_subnet" "lb_public_subnets" {

  count = length(var.public_lb_subnets)
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.public_lb_subnets[count.index]
  availability_zone = var.availability_zones[count.index]
  tags = merge({"Name" = "${var.Environment}-public-${var.availability_zones[count.index]}"},
  var.public_subnet_tags)
}

