locals {
    ecs_configuration = {
        nginx_fargate = {
            # task
            cpu                     = 512
            memory                  = 2048
            container_definitions   = "../resources/ecs-task-definitions/nginx.json"
            assign_public_ip        = true
            launch_type             = "FARGATE"
        }
    }
}