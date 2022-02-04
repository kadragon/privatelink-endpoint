resource "aws_vpc" "elastic-vpc" {
  cidr_block = "10.0.0.0/16"
  #   enable_dns_hostnames = true
  #   enable_dns_support   = true

  tags = {
    Name = "elastic-vpc"
  }
}

resource "aws_subnet" "elastic-subnet-1" {
  vpc_id     = aws_vpc.elastic-vpc.id
  cidr_block = "10.0.1.0/24"

  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "elastic-subnet-1"
  }
}

resource "aws_subnet" "elastic-subnet-2" {
  vpc_id     = aws_vpc.elastic-vpc.id
  cidr_block = "10.0.2.0/24"

  availability_zone = "ap-northeast-2b"

  tags = {
    Name = "elastic-subnet-2"
  }
}

resource "aws_subnet" "elastic-subnet-3" {
  vpc_id     = aws_vpc.elastic-vpc.id
  cidr_block = "10.0.3.0/24"

  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "elastic-subnet-3"
  }
}

# resource "aws_internet_gateway" "elastic-igw" {
#   vpc_id = aws_vpc.elastic-vpc.id

#   tags = {
#     Name = "elastic-vpc"
#   }
# }

# resource "aws_route_table" "elastic-vpc-route-table" {
#   vpc_id = aws_vpc.elastic-vpc.id

#   tags = {
#     Name = "elastic-vpc-route-table"
#   }
# }

# resource "aws_route_table_association" "route_table_association_1" {
#   subnet_id      = aws_subnet.first_subnet.id
#   route_table_id = aws_route_table.route_table.id
# }

# resource "aws_route_table_association" "route_table_association_2" {
#   subnet_id      = aws_subnet.second_subnet.id
#   route_table_id = aws_route_table.route_table.id
# }

# resource "aws_subnet" "first_private_subnet" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = "10.0.3.0/24"

#   availability_zone = "ap-northeast-2a"

#   tags = {
#     Name = "101subnet-private-1"
#   }
# }

# resource "aws_subnet" "second_private_subnet" {
#   vpc_id     = aws_vpc.main.id
#   cidr_block = "10.0.4.0/24"

#   availability_zone = "ap-northeast-2b"

#   tags = {
#     Name = "101subnet-private-2"
#   }
# }
