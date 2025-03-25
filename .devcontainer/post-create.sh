#!/bin/bash
set -e

echo "Installing XTP CLI..."
curl -s https://static.dylibso.com/cli/install.sh | sudo sh

echo "Installing MCP.run CLI (mcpx)..."
npm install -g @dylibso/mcpx

echo "Setting up TypeScript environment..."
npm install -g typescript ts-node

echo "Setting up Rust environment with WebAssembly target..."
# This is already set up by the features, but we add WebAssembly target and tools
rustup target add wasm32-wasi wasm32-unknown-unknown
rustup component add clippy rustfmt
cargo install cargo-watch cargo-expand wasm-pack

echo "Configuring TinyGo..."
# Setup TinyGo environment variables and add to PATH
echo 'export TINYGOROOT=/usr/local/tinygo' >> ~/.bashrc
echo 'export PATH="$PATH:/usr/local/bin:$HOME/.cargo/bin:/usr/local/tinygo/bin"' >> ~/.bashrc

# Create a sample Go servlet directory
mkdir -p ~/samples/go-servlet
cat > ~/samples/go-servlet/main.go << 'EOF'
package main

import (
	"encoding/json"
	"fmt"

	pdk "github.com/extism/go-pdk"
)

//export call
func call() int32 {
	input := pdk.Input()
	var request map[string]interface{}
	json.Unmarshal(input, &request)

	params, ok := request["params"].(map[string]interface{})
	if !ok {
		return 1
	}

	args, ok := params["arguments"].(map[string]interface{})
	if !ok {
		return 1
	}

	name, ok := args["name"].(string)
	if !ok {
		name = "world"
	}

	result := map[string]interface{}{
		"content": []map[string]interface{}{
			{
				"type": "text",
				"text": fmt.Sprintf("Hello, %s! This is a Go servlet built with TinyGo.", name),
			},
		},
	}

	resultJSON, _ := json.Marshal(result)
	mem := pdk.AllocateString(string(resultJSON))
	pdk.OutputMemory(mem)

	return 0
}

//export describe
func describe() int32 {
	description := `{
		"tools": [
			{
				"name": "greet",
				"description": "A simple greeting tool built with TinyGo",
				"inputSchema": {
					"type": "object",
					"properties": {
						"name": {
							"type": "string",
							"description": "The name to greet"
						}
					}
				}
			}
		]
	}`

	mem := pdk.AllocateString(description)
	pdk.OutputMemory(mem)

	return 0
}

func main() {}
EOF

echo "Setting up environment..."

# Create a convenience script for MCP.run login
cat > ~/mcp-login.sh << 'EOF'
#!/bin/bash
echo "Logging into MCP.run..."
mcpx login
echo "Login complete! You can now use MCP.run tools."
EOF

chmod +x ~/mcp-login.sh

# Create a convenience script for XTP login
cat > ~/xtp-login.sh << 'EOF'
#!/bin/bash
echo "To authenticate with XTP, run: export XTP_TOKEN=your_token_here"
echo "You can get your token from: https://xtp.dylibso.com/tokens"
EOF

chmod +x ~/xtp-login.sh

echo ""
echo "Installation complete!"
echo "To login to MCP.run, run: ~/mcp-login.sh"
echo "For XTP token instructions, run: ~/xtp-login.sh"
echo "TinyGo is installed and ready to use for building Go WebAssembly servlets"
