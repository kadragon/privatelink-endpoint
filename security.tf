# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group_rule

resource "aws_security_group" "elastic-security" {
  vpc_id      = aws_vpc.elastic-vpc.id
  name        = "ElasticSearch Security Group"
  description = "ElasticSearch Security Group"

  tags = {
    Name = "ElasticSearch Security Group"
  }
}

resource "aws_security_group_rule" "elastic-ingress-rule-1" {
  type      = "ingress"
  from_port = 9243
  to_port   = 9243
  protocol  = "tcp"

  cidr_blocks       = [aws_vpc.elastic-vpc.cidr_block]
  security_group_id = aws_security_group.elastic-security.id
}

resource "aws_security_group_rule" "elastic-egress-rule-1" {
  type      = "egress"
  from_port = 0
  to_port   = 0
  protocol  = "tcp"

  cidr_blocks       = [aws_vpc.elastic-vpc.cidr_block]
  security_group_id = aws_security_group.elastic-security.id
}
