output "jwt_url" {
  value = "https://${aws_cognito_user_pool_domain.this.domain}.auth.${var.aws_region}.amazoncognito.com/.well-known/jwks.json"
}

output "issuer" {
  value = "https://${aws_cognito_user_pool_domain.this.domain}.auth.${var.aws_region}.amazoncognito.com"
}

output "token_endpoint" {
  value = "https://${aws_cognito_user_pool_domain.this.domain}.auth.${var.aws_region}.amazoncognito.com/oauth2/token"
}

output "client_id" {
  value = aws_cognito_user_pool_client.this.id
}

output "client_secret" {
  value     = aws_cognito_user_pool_client.this.client_secret
  sensitive = true
}
