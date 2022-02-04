output "elastic-endpoint-id" {
  description = "elastic privatelink endpoint id"
  value       = aws_vpc_endpoint.elastic-endpoint.id
}
