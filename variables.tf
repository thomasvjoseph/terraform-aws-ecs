variable "ecs_resources" {
  type = map(object({
    ecs_cluster_name = string
    name = string
    env = string
    ecs_task_def_family = string
    ecs_task_def_network_mode = string
    ecs_task_requires_compatibilities = list(string)
    ecs_os_family = optional(string, "LINUX")
    ecs_cpu_architecture = optional(string, "X86_64")
    ecs_task_def_cpu = number
    ecs_task_def_memory = number
    ecs_task_def_task_role_arn = optional(string, null)
    ecs_task_def_execution_role_arn = string
    ecs_task_def_container_name = string
    ecs_image_url = string
    ecs_container_cpu = optional(number, null)
    ecs_container_memory_reservation = optional(number, null)
    ecs_task_def_container_port = optional(number, null)
    ecs_task_def_host_port = optional(number, null)
    ecs_awslogs_group = string
    aws_region = string
    ecs_service_name = string
    ecs_launch_type = string
    ecs_desired_count = number
    ecs_security_group = list(string)
    ecs_target_group_arn = optional(string, "")
    ecs_service_container_name = string
    ecs_service_container_port = number
  }))
  description = "Map of ECS resources, including cluster, task definition, and service configuration."
}

variable "subnet_ids" {
  type = list(string)
  description = "List of subnet IDs for the ECS tasks. This is required for Fargate to define where the service runs."
}

variable "ecs_asg_max_size" {
  type = number
  description = "Maximum number of tasks for autoscaling. This is used for defining the scaling limits of the service."
}

variable "ecs_asg_min_size" {
  type = number
  description = "Minimum number of tasks for autoscaling. This is used for defining the scaling limits of the service."
}

variable "enable_autoscaling" {
  type = bool
  description = "Flag to enable or disable autoscaling for the ECS service. Optional, defaults to 'false'."
  default = false
}

variable "enable_cpu_autoscaling" {
  type = bool
  description = "Flag to enable CPU-based autoscaling. Optional, defaults to 'false'. Requires 'enable_autoscaling' to be 'true'."
  default = false
}

variable "enable_memory_autoscaling" {
  type = bool
  description = "Flag to enable memory-based autoscaling. Optional, defaults to 'false'. Requires 'enable_autoscaling' to be 'true'."
  default = false
}

variable "cpu_target_value" {
  type = number
  description = "Target value for CPU utilization-based autoscaling. Optional, defaults to 70%."
  default = 70
}

variable "memory_target_value" {
  type = number
  description = "Target value for memory utilization-based autoscaling. Optional, defaults to 85%."
  default = 85
}