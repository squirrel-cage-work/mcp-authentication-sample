import asyncio
from fastmcp import Client
from fastmcp.client.transports import StreamableHttpTransport
import os

async def main():

    token = os.environ.get("TOKEN")

    transport = StreamableHttpTransport("http://127.0.0.1:8888/mcp", auth=token)
    
    async with Client(transport) as client:
        tools = await client.list_tools()
        print(tools)
        results = await client.call_tool("add", {"a":3, "b":4})
        print(results)

if __name__ == "__main__":
    asyncio.run(main())
