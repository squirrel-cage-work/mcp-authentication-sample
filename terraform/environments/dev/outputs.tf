output "jwt_url" {
  value = "module.cognito.jwt_url"
}

output "issuer" {
  value = module.cognito.issuer
}

output "token_endpoint" {
  value = module.cognito.token_endpoint
}

output "client_id" {
  value = module.cognito.client_id
}

output "client_secret" {
  value     = module.cognito.client_secret
  sensitive = true
}
