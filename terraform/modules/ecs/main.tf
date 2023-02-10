terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

variable "iam_role_arn" {
  type = string
}
resource "aws_ecs_cluster" "terraform_cluster" {
  name = "terraform-cluster"

  setting {
    name  = "containerInsights"
    value = "disabled"
  }

  tags = {
    app = "terraform"
  }
}

resource "aws_ecs_cluster_capacity_providers" "terraform_cluster_providers" {
  cluster_name = aws_ecs_cluster.terraform_cluster.name

  capacity_providers = ["FARGATE", "FARGATE_SPOT"]

}

resource "aws_ecs_task_definition" "terraform_task" {
  family = "Terraform-task"
  cpu = 1024
  memory = 2048

  container_definitions = <<TASK_DEFINITION
  [
    {
        "name": "script-runner",
        "image": "alpine:3.17",
        "cpu": 0,
        "portMappings": [
            {
                "name": "script-runner-80-tcp",
                "containerPort": 80,
                "hostPort": 80,
                "protocol": "tcp",
                "appProtocol": "http"
            }
        ],
        "essential": true,
        "environment": [],
        "environmentFiles": [],
        "mountPoints": [],
        "volumesFrom": [],
        "command": ["pip", "install", "-r", "requirements.txt"]
    }
  ]
  TASK_DEFINITION
  
  network_mode = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  task_role_arn = var.iam_role_arn
  execution_role_arn = var.iam_role_arn
  tags = {
    app = "terraform"
  }

}