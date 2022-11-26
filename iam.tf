resource "aws_iam_role" "instance_role" {
  name        = "${var.name}_instance_${var.environment}"
  description = "Instance role to provision ${var.name} in the ${var.environment} environment"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

data "aws_iam_policy" "managed_ssm_policy" {
  name = "AmazonSSMManagedInstanceCore"
}

resource "aws_iam_role_policy_attachment" "ssm" {
  role       = aws_iam_role.instance_role.name
  policy_arn = data.aws_iam_policy.managed_ssm_policy.arn
}
