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

echo "Setting up environment..."

# Add tools to the PATH
echo 'export PATH="$PATH:/usr/local/bin:$HOME/.cargo/bin"' >> ~/.bashrc

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
