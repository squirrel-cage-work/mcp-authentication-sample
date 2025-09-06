audienceの検証ができません。
テスト的な確認。

# create amazon cognito

create cognito for ![client credential](https://docs.aws.amazon.com/cognito/latest/developerguide/federation-endpoints-oauth-grants.html)
```
cd mcp-authentication-sample/terraform/environments/dev
terraform init
terraform plan
terraform apply
```
delete cognito
```
cd mcp-authentication-sample/terraform/environments/dev
terraform destroy
```

parameters 
```
cat terraform.tfvars
aws_region = ""

# cognito
cognito_user_pool_name  = ""
cognito_app_client_name = ""
cognito_domain_name     = ""
```

outpots（ちょっと変）
```
client_id = ""
client_secret = <sensitive>
issuer = ""
jwt_url = ""
token_endpoint = ""
```

# environments

set environments
```
export CLIENTID=
export CLIENTSECRET=
export TOKENENDPOINT=
export JWTURL=
export ISSUER=
export AUTHHEADER=$(echo -n "${CLIENTID}:${CLIENTSECRET}" | base64 -w 0)
```

get token
``` 
curl -X POST ${TOKENENDPOINT} \
 -H "Content-Type: application/x-www-form-urlencoded" \
 -H "Authorization: Basic ${AUTHHEADER}" \
 -d "grant_type=client_credentials"
```

set token
```
export TOKEN=
```

# fastmcp
https://gofastmcp.com/getting-started/welcome

run server
```
cd mcp-authentication-sample/mcp-sample
python server.py
```

run client
```
python client.py
```

# Test
with incorrect token
```
...
httpx.HTTPStatusError: Client error '401 Unauthorized' for url 'http://127.0.0.1:8888/mcp'
For more information check: https://developer.mozilla.org/en-US/docs/Web/HTTP/Status/401
```

with correct token
```
[Tool(name='add', title=None, description='Add two numbers', inputSchema={'properties': {'a': {'title': 'A', 'type': 'integer'}, 'b': {'title': 'B', 'type': 'integer'}}, 'required': ['a', 'b'], 'type': 'object'}, outputSchema={'properties': {'result': {'title': 'Result', 'type': 'integer'}}, 'required': ['result'], 'title': '_WrappedResult', 'type': 'object', 'x-fastmcp-wrap-result': True}, annotations=None, meta={'_fastmcp': {'tags': []}})]
CallToolResult(content=[TextContent(type='text', text='7', annotations=None, meta=None)], structured_content={'result': 7}, data=7, is_error=False)
```