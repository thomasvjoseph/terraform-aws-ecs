variable "ecs_resources" {
  description = "Map of ECS resources, including cluster, task definition, and service configuration."
  type = map(object({
    # cluster
    ecs_cluster_name = string
    # task definition
    ecs_task_def_family               = string
    ecs_task_def_network_mode         = string
    ecs_task_requires_compatibilities = list(string)
    ecs_os_family                     = optional(string, "LINUX")
    ecs_cpu_architecture              = optional(string, "X86_64")
    ecs_task_def_cpu                  = number
    ecs_task_def_memory               = number
    ecs_task_def_task_role_arn        = optional(string, null)
    ecs_task_def_execution_role_arn   = string
    ecs_task_def_container_name       = string
    ecs_image_url                     = string
    ecs_container_cpu                 = optional(number, null)
    ecs_container_memory_reservation  = optional(number, null)
    ecs_task_def_container_port       = optional(number, null)
    ecs_task_def_host_port            = optional(number, null)
    ecs_awslogs_group                 = string
    aws_region                        = string
    # service
    ecs_service_name           = string
    ecs_launch_type            = string
    ecs_security_group         = list(string)
    ecs_target_group_arn       = optional(string, "")
    ecs_service_container_name = string
    ecs_service_container_port = number
    subnet_ids                 = list(string)
    assign_public_ip           = optional(bool, false)
    desired_count              = optional(number, 1)
    # autoscaling
    enable_autoscaling        = optional(bool, false)
    enable_cpu_autoscaling    = optional(bool, false)
    enable_memory_autoscaling = optional(bool, false)
    asg_max_size              = optional(number, 2)
    asg_min_size              = optional(number, 1)
    cpu_target_value          = optional(number, 70)
    memory_target_value       = optional(number, 85)
    tags                      = optional(map(string), {})
  }))
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Tags applied to all resources."
}
