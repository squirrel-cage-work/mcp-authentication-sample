# create user pool
resource "aws_cognito_user_pool" "this" {
    name = var.user_pool_name
}

# create resource server and scope
resource "aws_cognito_resource_server" "this" {
    identifier   = "https://api.example.local"
    name         = "example api"

    user_pool_id = aws_cognito_user_pool.this.id

    scope {
        scope_name        = "read"
        scope_description = "read access"
    }

    scope {
        scope_name        = "write"
        scope_description = "write access"
    }
}

# create app client
resource "aws_cognito_user_pool_client" "this" {
    name                                 = var.app_client_name
    user_pool_id                         = aws_cognito_user_pool.this.id

    generate_secret                      = true

    allowed_oauth_flows                  = ["client_credentials"]
    allowed_oauth_scopes                 = [
        "${aws_cognito_resource_server.this.identifier}/read", 
        "${aws_cognito_resource_server.this.identifier}/write"
        ]

    allowed_oauth_flows_user_pool_client = true

    supported_identity_providers = ["COGNITO"]

    callback_urls = ["https://example.local/callback"]
    logout_urls   = ["https://example.local/logout"]

}

# create domain name
resource "aws_cognito_user_pool_domain" "this" {
    domain       = var.domain_name
    user_pool_id = aws_cognito_user_pool.this.id
}