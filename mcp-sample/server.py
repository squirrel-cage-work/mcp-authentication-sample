from fastmcp import FastMCP
from fastmcp.server.auth.providers.jwt import JWTVerifier
import httpx
import os

verifier = JWTVerifier(
    jwks_uri = os.environ.get("JWTURL"),
    issuer   = os.environ.get("ISSUER")
)

mcp = FastMCP(name="Protected API", auth=verifier)

@mcp.tool
def add(a: int, b: int) -> int:
    """Add two numbers"""
    return a + b

if __name__ == "__main__":
    mcp.run(transport="http", port=8888, host="0.0.0.0", path="/mcp")