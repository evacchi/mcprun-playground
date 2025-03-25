#!/bin/bash
set -e

echo "Installing XTP CLI..."
curl -s https://static.dylibso.com/cli/install.sh | sudo sh

echo "Setting up TypeScript environment..."
npm install -g typescript ts-node

echo "Setting up Rust environment..."
# This is already set up by the features, but we can add additional Rust tools if needed
rustup component add clippy rustfmt
cargo install cargo-watch cargo-expand
rustup target add wasm32-wasip1

echo "Installing TinyGo..."
# The repository was added in the Dockerfile, now we install the package
sudo apt-get update && sudo apt-get install -y tinygo

echo "Setting up environment..."

# Add tools to the PATH
echo 'export PATH="$PATH:/usr/local/bin:$HOME/.cargo/bin"' >> ~/.bashrc


chmod +x ~/tinygo-hello.sh

echo ""
echo "Installation complete!"
