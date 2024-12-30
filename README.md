# terraform-aws-ecs

Terraform module to create ECS Fargate resources with auto-scaling options.

## Usage

```hcl
module "ecs" {
  source = "./path/to/your/module"

  ecs_resources = {
    example = {
      ecs_cluster_name                = "example-cluster"
      name                            = "example"
      env                             = "dev"
      ecs_task_def_family             = "example-family"
      ecs_task_def_network_mode       = "awsvpc"
      ecs_task_requires_compatibilities = ["FARGATE"]
      ecs_task_def_cpu                = 256
      ecs_task_def_memory             = 512
      ecs_task_def_execution_role_arn = "arn:aws:iam::123456789012:role/ecsTaskExecutionRole"
      ecs_task_def_container_name     = "example-container"
      ecs_image_url                   = "nginx:latest"
      ecs_awslogs_group               = "/ecs/example"
      aws_region                      = "ap-south-1"
      ecs_service_name                = "example-service"
      ecs_launch_type                 = "FARGATE"
      ecs_security_group              = ["sg-0123456789abcdef0"]
      ecs_service_container_name      = "example-container"
      ecs_service_container_port      = 80
    }
  }

  subnet_ids = ["subnet-0123456789abcdef0", "subnet-abcdef0123456789"]
  desired_count = 1
  ecs_asg_max_size = 10
  ecs_asg_min_size = 1
  enable_autoscaling = true
  enable_cpu_autoscaling = true
  enable_memory_autoscaling = true
  cpu_target_value = 70
  memory_target_value = 85
}
```
## Inputs

| Name                       | Description                                 | Type     | Default | Required |
|----------------------------|---------------------------------------------|----------|---------|----------|
| ecs_resources              | Map of ECS resources                        | `map`    | `{}`    | `yes`    |
| subnet_ids                 | List of subnet IDs                          | `list`   | `[]`    | `yes`    |
| desired_count              | Desired number of tasks                     | `number` | `1`     | `no`     |
| ecs_asg_max_size           | Maximum number of tasks in the ECS cluster   | `number` | `10`    | `no`     |
| ecs_asg_min_size           | Minimum number of tasks in the ECS cluster   | `number` | `1`     | `no`     |
| enable_autoscaling         |  Enable autoscaling                          | `bool`   | `false` | `no`     |
| enable_cpu_autoscaling     | Enable CPU autoscaling                      | `bool`   | `false` | `no`     |
| enable_memory_autoscaling  | Enable memory autoscaling                   | `bool`   | `false` | `no`     |
| cpu_target_value           | CPU target value for autoscaling            | `number` | `70`    | `no`     |
| memory_target_value        | Memory target value for autoscaling         | `number` | `85`    | `no`     |

## ecs_resources Object
| Name                       | Description                                 | Type     | Default | Required |
|----------------------------|---------------------------------------------|----------|---------|----------|
| ecs_cluster_name           | Name of the ECS cluster                    | `string` | `""`    | `yes`    |
| name                       | Name of the ECS resource                   | `string` | `""`    | `yes`    |
| enviornment                | Environment of the ECS resource            | `string` | `""`    | `yes`    |
| ecs_task_family           | Name of the ECS task definition family     | `string` | `""`    | `yes`    |
| ecs_task_def_network_mode  | Network mode for the ECS task definition   | `string` | `""`    | `yes`    |
| ecs_task_requires_compatibilities | ECS task requires compatibilities         | `list`   | `[]`    | `yes`    |
| ecs_os_family             | Operating system family for the ECS task   | `string` | `""`    | `yes`    |
| ecs_cpu_architecture       | CPU architecture for the ECS task         | `string` | `""`    | `yes`    |
| ecs_task_def_cpu           | CPU units for the ECS task definition     | `number` | `0`     | `yes`    |
| ecs_task_def_memory        | Memory in MiB for the ECS task definition | `number` | `0`     | `yes`    |
| ecs_task_def_execution_role_arn | ARN of the ECS task execution role     | `string` | `""`    | `yes`    |
| ecs_task_def_container_name | Name of the ECS task definition container | `string` | `""`    | `yes`    |
| ecs_image_url              | URL of the ECS task definition image      | `string` | `""`    | `yes`    |
| ecs_container_port        | Port for the ECS task definition container | `number` | `0`     | `yes`    |
| ecs_container_memory       | Memory in MiB for the ECS task definition container | `number` | `0`     | `yes`    |
| ecs_container_memory_reservation | Memory reservation in MiB for the ECS task definition container | `number` | `0`     | `yes`    |
| ecs_container_cpu          | CPU units for the ECS task definition container | `number` | `0`     | `yes`    |
| ecs_awslogs_group          | Name of the ECS CloudWatch Logs group      | `string` | `""`    | `yes`    |
| aws_region                 | AWS region for the ECS resource           | `string` | `""`    | `yes`    |
| ecs_service_name          | Name of the ECS service                   | `string` | `""`    | `yes`    |
| ecs_launch_type            | Launch type for the ECS service           | `string` | `""`    | `yes`    |
| ecs_security_group         | List of security group IDs for the ECS service | `list`   | `[]`    | `yes`    |
| ecs_service_container_name | Name of the ECS service container         | `string` | `""`    | `yes`    |
| ecs_service_container_port | Port number for the ECS service container | `number` | `0`     | `yes`    |


## Outputs
| Name                       | Description                                 |
|----------------------------|---------------------------------------------|
| ecs_cluster_name           | Name of the ECS cluster                    |
| ecs_task_definition_arn        | The ARN of the ECS task definition.     |
| ecs_service_name  | The name of the ECS service.    |
| ecs_service_arn | The ARN of the ECS service. |
| ecs_autoscaling_target_arn           | The ARN of the ECS autoscaling target.      |
|ecs_autoscaling_policy_memory_arn	| The ARN of the ECS memory autoscaling policy. |
|ecs_autoscaling_policy_cpu_arn	| The ARN of the ECS CPU autoscaling policy. |


## License

This module is licensed under the MIT License. See [LICENSE](LICENSE) for more information.

## Author: 

thomas joseph
- [linkedin](https://www.linkedin.com/in/thomas-joseph-88792b132/)
- [medium](https://medium.com/@thomasvjoseph)