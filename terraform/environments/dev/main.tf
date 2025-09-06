provider "aws" {
    region = var.aws_region
}

module "cognito" {
    source          = "../../modules/cognito"
    user_pool_name  = var.cognito_user_pool_name
    app_client_name = var.cognito_app_client_name
    domain_name     = var.cognito_domain_name
    aws_region      = var.aws_region
}