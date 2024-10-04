variable "ecs_resources" {
  type = map(object({
    ecs_cluster_name = string
    description = "The name of the ECS cluster. This is required to define where the ECS services will run."

    name = string
    description = "The name of the resource for identification and tagging purposes."

    env = string
    description = "The environment where this ECS resource will run (e.g., dev, staging, prod)."

    ecs_task_def_family = string
    description = "The family of your ECS task definition. This is used to group multiple versions of the same task definition."

    ecs_task_def_network_mode = string
    description = "The network mode for your ECS tasks. In Fargate, 'awsvpc' mode is required."

    ecs_task_requires_compatibilities = list(string)
    description = "Defines which launch type (e.g., FARGATE) the task supports. This is required for Fargate."

    ecs_os_family = optional(string, "LINUX")
    description = "The operating system of the ECS task. Optional, defaults to 'LINUX'."

    ecs_cpu_architecture = optional(string, "X86_64")
    description = "The CPU architecture of the ECS task. Optional, defaults to 'X86_64'."

    ecs_task_def_cpu = number
    description = "The number of CPU units to allocate to the task. This is required for Fargate."

    ecs_task_def_memory = number
    description = "The amount of memory (in MiB) to allocate to the task. This is required for Fargate."

    ecs_task_def_task_role_arn = optional(string, null)
    description = "The ARN of the IAM role that your task can assume. Optional, if not needed."

    ecs_task_def_execution_role_arn = string
    description = "The ARN of the IAM role that ECS will use to execute the task (e.g., pulling container images). This is required."

    ecs_task_def_container_name = string
    description = "The name of the container within the task definition. This is required."

    ecs_image_url = string
    description = "The container image to run in your task. This is required (e.g., nginx:latest)."

    ecs_container_cpu = optional(number, null)
    description = "The number of CPU units allocated to the container. Optional."

    ecs_container_memory_reservation = optional(number, null)
    description = "The soft limit (in MiB) of memory reserved for the container. Optional."

    ecs_task_def_container_port = optional(number, null)
    description = "The container port to expose on the task. Optional, only required if using port mappings."

    ecs_task_def_host_port = optional(number, null)
    description = "The host port to map to the container port. Optional, only required if using port mappings."

    ecs_awslogs_group = string
    description = "The name of the CloudWatch Logs group for ECS task logging. This is required."

    aws_region = string
    description = "The AWS region where the ECS resources will be deployed. This is required."

    ecs_service_name = string
    description = "The name of the ECS service. This is required to identify and manage the service."

    ecs_launch_type = string
    description = "The launch type for the ECS service (e.g., FARGATE). This is required."

    ecs_desired_count = number
    description = "The number of desired task instances to run in the ECS service. This is required."

    ecs_security_group = list(string)
    description = "List of security groups to assign to the ECS tasks. This is required for Fargate."

    ecs_target_group_arn = optional(string, "")
    description = "The ARN of the target group for load balancing. Optional, defaults to an empty string."

    ecs_service_container_name = string
    description = "The name of the container within the ECS service. This is required if using a load balancer."

    ecs_service_container_port = number
    description = "The port on the container to be registered with a load balancer. This is required if using a load balancer."
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