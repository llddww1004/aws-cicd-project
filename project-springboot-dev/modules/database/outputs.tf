output "rds_endpoint" {
  description = "RDS 접속 endpoint (DNS)"
  value       = aws_db_instance.main.address
}

output "rds_port" {
  description = "RDS 포트"
  value       = aws_db_instance.main.port
}

output "rds_identifier" {
  description = "RDS Instance Identifier (modify-db-instance, describe-db-instances 등 AWS CLI용)"
  value       = aws_db_instance.main.identifier
}
