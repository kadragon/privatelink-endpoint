# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc

resource "aws_vpc" "elastic-vpc" {
  cidr_block = "10.0.0.0/16"

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

resource "aws_network_interface" "elastic-interface" {
  subnet_id = aws_subnet.elastic-subnet-2.id

  tags = {
    Name = "elastic-interface"
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone
resource "aws_route53_zone" "elastic-private-zone" {
  name = var.phsd_service

  vpc {
    vpc_id = aws_vpc.elastic-vpc.id
  }
}

# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record
resource "aws_route53_record" "elastic-private-zone-recode" {
  zone_id = aws_route53_zone.elastic-private-zone.zone_id
  name    = "*"
  type    = "CNAME"
  ttl     = "300"
  records = [aws_vpc_endpoint.elastic-endpoint.dns_entry[0]["dns_name"]]
}

