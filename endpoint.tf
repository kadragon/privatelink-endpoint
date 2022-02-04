# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_endpoint

resource "aws_vpc_endpoint" "elastic-endpoint" {
  vpc_id            = aws_vpc.elastic-vpc.id
  service_name      = var.ptfe_service
  vpc_endpoint_type = "Interface"

  security_group_ids = [
    aws_security_group.elastic-security.id,
  ]

  subnet_ids          = [aws_subnet.elastic-subnet-1.id, aws_subnet.elastic-subnet-2.id, aws_subnet.elastic-subnet-3.id]
  private_dns_enabled = false

  tags = {
    "Name" : "elastic-endpoint"
  }
}

