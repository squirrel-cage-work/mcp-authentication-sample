variable "user_pool_name" {
    description = "cognito user pool name"
    type        = string
}

variable "app_client_name" {
    description = "cognito app client name"
    type        = string
}

variable "domain_name" {
    description = "cognito domain name"
    type        = string
}

variable "aws_region" {
    description = "aws region"
    type        = string
} 