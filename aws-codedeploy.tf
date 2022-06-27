resource "aws_iam_role" "CodeDeployRole1" {
  name = "CodeDeployRole1"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "codedeploy.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "AWSCodeDeployRole" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole"
  role       = aws_iam_role.CodeDeployRole1.name
}

resource "aws_codedeploy_app" "demo_deploy" {
  compute_platform = "Server"
  name             = "demo_deploy"
}

resource "aws_codedeploy_deployment_group" "demo_deploy_group" {
  app_name              = aws_codedeploy_app.demo_deploy.name
  deployment_group_name = "demo_deploy_group"
  service_role_arn      = aws_iam_role.CodeDeployRole1.arn

  ec2_tag_set {
    ec2_tag_filter {
      key   = "Name"
      type  = "KEY_AND_VALUE"
      value = "terraform-instance"
    }

  }
  
  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

  alarm_configuration {
    alarms  = ["my-alarm-name"]
    enabled = true
  }
}
