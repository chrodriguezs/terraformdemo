# Subnets
resource "aws_subnet" "main-public-1" {
  vpc_id                  = "vpc-043574869874c08de"
  cidr_block              = "10.1.0.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-1a"

  tags = {
    Name = "main-public-1",
    Project = "DEMO_Ene20"
  }
}

resource "aws_subnet" "main-public-2" {
  vpc_id                  = "vpc-043574869874c08de"
  cidr_block              = "10.2.0.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-1b"

  tags = {
    Name = "main-public-2",
    Project = "DEMO_Ene20"
  }
}

resource "aws_subnet" "main-public-3" {
  vpc_id                  = "vpc-043574869874c08de"
  cidr_block              = "10.3.0.0/24"
  map_public_ip_on_launch = "true"
  availability_zone       = "eu-west-1c"

  tags = {
    Name = "main-public-3",
    Project = "DEMO_Ene20"
  }
}

resource "aws_subnet" "main-private-1" {
  vpc_id                  = "vpc-043574869874c08de"
  cidr_block              = "10.4.0.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-1a"

  tags = {
    Name = "main-private-1",
    Project = "DEMO_Ene20"
  }
}

resource "aws_subnet" "main-private-2" {
  vpc_id                  = "vpc-043574869874c08de"
  cidr_block              = "10.5.0.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-1b"

  tags = {
    Name = "main-private-2",
    Project = "DEMO_Ene20"
  }
}

resource "aws_subnet" "main-private-3" {
  vpc_id                  = "vpc-043574869874c08de"
  cidr_block              = "10.6.0.0/24"
  map_public_ip_on_launch = "false"
  availability_zone       = "eu-west-1c"

  tags = {
    Name = "main-private-3",
    Project = "DEMO_Ene20"
  }
}

# Internet GW
#resource "aws_internet_gateway" "main-gw" {
#  vpc_id = "vpc-043574869874c08de"

#  tags = {
#    Name = "main",
#    Project = "DEMO_Ene20"
#  }
#}

# route tables
#resource "aws_route_table" "main-public" {
#  vpc_id = "vpc-043574869874c08de"
#  route {
#    cidr_block = "0.0.0.0/0"
#    gateway_id = aws_internet_gateway.main-gw.id
#  }
#
#  tags = {
#    Name = "main-public-1",
#    Project = "DEMO_Ene20"
#  }
#}

# route associations public
resource "aws_route_table_association" "main-public-1-a" {
  subnet_id      = aws_subnet.main-public-1.id
  route_table_id = aws_route_table.main-public.id
}

resource "aws_route_table_association" "main-public-2-a" {
  subnet_id      = aws_subnet.main-public-2.id
  route_table_id = aws_route_table.main-public.id
}

resource "aws_route_table_association" "main-public-3-a" {
  subnet_id      = aws_subnet.main-public-3.id
  route_table_id = aws_route_table.main-public.id
}

