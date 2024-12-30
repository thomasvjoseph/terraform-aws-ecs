output "ecs_cluster_name" {
  value = { for k, v in aws_ecs_cluster.ecs_cluster : k => v.name }
}

output "ecs_task_definition_arn" {
  value = { for k, v in aws_ecs_task_definition.ecs_task_definition : k => v.arn }
}

output "ecs_service_name" {
  value = { for k, v in aws_ecs_service.ecs_service : k => v.name }
}

output "ecs_service_arn" {
  description = "The ARN of the ECS service"
  value       = { for k, v in aws_ecs_service.ecs_service : k => v.id }
}

output "ecs_autoscaling_target_arn" {
  description = "The ARN of the ECS autoscaling target"
  value       = { for k, v in aws_appautoscaling_target.ecs_target : k => v.arn }
  depends_on  = [aws_appautoscaling_target.ecs_target]
}

output "ecs_autoscaling_policy_memory_arn" {
  description = "The ARN of the ECS memory autoscaling policy"
  value       = { for k, v in aws_appautoscaling_policy.ecs_policy_memory : k => v.arn }
  depends_on  = [aws_appautoscaling_policy.ecs_policy_memory]
}

output "ecs_autoscaling_policy_cpu_arn" {
  description = "The ARN of the ECS CPU autoscaling policy"
  value       = { for k, v in aws_appautoscaling_policy.ecs_policy_cpu : k => v.arn }
  depends_on  = [aws_appautoscaling_policy.ecs_policy_cpu]
}