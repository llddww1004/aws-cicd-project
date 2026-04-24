############################
# DR 운영용 Outputs
# Jenkins 파이프라인이 `terraform output -raw <이름>` 으로 사용
############################

############################
# DB EC2 (Stop/Start 제어)
############################
output "db_ec2_instance_id" {
  description = "DB EC2 인스턴스 ID (Replication 상태 조회, SSH 접속 대상 식별용)"
  value       = module.compute.db_ec2_instance_id
}

output "db_ec2_private_ip" {
  description = "DB EC2 프라이빗 IP (검증용, 10.0.61.199 고정)"
  value       = module.compute.db_ec2_private_ip
}

############################
# RDS
############################
output "rds_endpoint" {
  description = "RDS 접속 endpoint (mysql -h <여기> 형태로 접속)"
  value       = module.database.rds_endpoint
}

output "rds_identifier" {
  description = "RDS Instance Identifier (AWS CLI describe-db-instances 등에 사용)"
  value       = module.database.rds_identifier
}

############################
# ALB (트래픽 라우팅 검증)
############################
output "alb_dns_name" {
  description = "ALB DNS name (curl 동작 검증, Route53 alias 대상)"
  value       = module.compute.alb_dns_name
}

output "alb_listener_arn" {
  description = "ALB Listener ARN (DR 시 forward 대상 TG 확인용)"
  value       = module.compute.alb_listener_arn
}

############################
# Target Groups (Health 체크)
############################
output "haproxy_tg_arn" {
  description = "HAProxy Target Group ARN (평상시 트래픽이 가는 TG)"
  value       = module.compute.haproxy_target_group_arn
}

output "springboot_tg_arn" {
  description = "Spring Boot Target Group ARN (DR 모드 시 트래픽이 가는 TG)"
  value       = module.compute.springboot_target_group_arn
}

############################
# Auto Scaling (Deploy / Rollback 핵심)
############################
output "springboot_asg_name" {
  description = "Spring Boot ASG name (Instance Refresh, desired_capacity 변경 등)"
  value       = module.compute.autoscaling_group_name
}

output "launch_template_id" {
  description = "Launch Template ID (Rollback 시 default version 변경)"
  value       = module.compute.launch_template_id
}

output "launch_template_latest_version" {
  description = "Launch Template 최신 버전 번호 (Rollback 시 이전 버전 = $current - 1)"
  value       = module.compute.launch_template_latest_version
}

############################
# 운영 편의
############################
output "bastion_public_ip" {
  description = "Bastion Public IP (Private EC2 SSH 점프용)"
  value       = module.compute.bastion_public_ip
}
