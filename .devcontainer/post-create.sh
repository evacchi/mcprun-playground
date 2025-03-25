#!/bin/bash
set -e

echo "Installing XTP CLI..."
curl -s https://static.dylibso.com/cli/install.sh | sudo sh

echo "Installing MCP.run CLI..."
npm install -g @mcp/cli

echo "Setting up TypeScript environment..."
npm install -g typescript ts-node

echo "Setting up Rust environment..."
# This is already set up by the features, but we can add additional Rust tools if needed
rustup component add clippy rustfmt
cargo install cargo-watch cargo-expand

echo "Installing TinyGo..."
# The repository was added in the Dockerfile, now we install the package
sudo apt-get update && sudo apt-get install -y tinygo

echo "Setting up environment..."

# Add tools to the PATH
echo 'export PATH="$PATH:/usr/local/bin:$HOME/.cargo/bin"' >> ~/.bashrc

# Create a convenience script for MCP.run login
cat > ~/mcp-login.sh << 'EOF'
#!/bin/bash
echo "Logging into MCP.run..."
mcprun login
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

# Create a convenience script for TinyGo example
cat > ~/tinygo-hello.sh << 'EOF'
#!/bin/bash
mkdir -p ~/tinygo-examples/hello
cat > ~/tinygo-examples/hello/main.go << 'GOCODE'
package main

import "fmt"

func main() {
	fmt.Println("Hello from TinyGo!")
}
GOCODE

cd ~/tinygo-examples/hello
echo "Building TinyGo example..."
tinygo build -o hello main.go
echo "Running TinyGo example..."
./hello
echo ""
echo "TinyGo is working! You can find this example in ~/tinygo-examples/hello"
EOF

chmod +x ~/tinygo-hello.sh

echo ""
echo "Installation complete!"
echo "To login to MCP.run, run: ~/mcp-login.sh"
echo "For XTP token instructions, run: ~/xtp-login.sh"
echo "To test TinyGo installation, run: ~/tinygo-hello.sh"
