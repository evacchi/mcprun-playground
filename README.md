# mcprun-playground

## Development Environment

This repository is configured to work with GitHub Codespaces, providing a fully pre-configured development environment in the cloud.

### Using GitHub Codespaces

1. Click the green "Code" button on the repository page
2. Select the "Codespaces" tab
3. Click "Create codespace on main"

The Codespace will automatically install:
- XTP CLI for working with the XTP plugin system
- MCP.run CLI for searching and using MCP.run servlets
- Rust toolchain with Cargo, Clippy, and Rustfmt
- TinyGo for lightweight Go compilation targeting WebAssembly
- TypeScript with compiler and ts-node
- All necessary dependencies and development tools

### Authentication

After your Codespace is ready:

- To log in to MCP.run, run: `~/mcp-login.sh`
- For XTP token setup instructions, run: `~/xtp-login.sh`
- To test your TinyGo installation, run: `~/tinygo-hello.sh`

### Available Tools and Commands

#### XTP CLI
- `xtp-login` - Show XTP login instructions
- `xtp-apps` - List your XTP applications
- `xtp-exts` - List your XTP extension points

#### MCP.run CLI
- `mcp-login` - Log in to MCP.run
- `mcp-search` - Search for MCP.run servlets
- `mcp-install` - Install MCP.run servlets

#### Rust Shortcuts
- `rs-build` - Build Rust project (cargo build)
- `rs-run` - Run Rust project (cargo run)
- `rs-test` - Run tests (cargo test)
- `rs-check` - Check code without building (cargo check)
- `rs-clippy` - Run linter (cargo clippy)
- `rs-fmt` - Format code (cargo fmt)
- `rs-watch` - Watch for changes and check (cargo watch)

#### TypeScript Shortcuts
- `ts-build` - Build TypeScript (tsc)
- `ts-run` - Run TypeScript directly (ts-node)
- `ts-watch` - Watch for changes and compile (tsc --watch)

#### TinyGo Shortcuts
- `tgo-hello` - Run a simple TinyGo example (~/tinygo-hello.sh)
- `tgo-build` - Build a TinyGo project (tinygo build)
- `tgo-run` - Run a TinyGo program (tinygo run)
- `tgo-wasm` - Build for WebAssembly (tinygo build -target wasm)
- `tgo-list-targets` - List available build targets (tinygo targets)
- `tgo-version` - Display TinyGo version (tinygo version)
- `tgo-info` - Show TinyGo environment information (tinygo info)

## Getting Started

After your Codespace is set up and you've authenticated with the necessary services, you can start developing:

### For Rust development:
1. Create a new Rust project: `cargo new my_project`
2. Navigate to it: `cd my_project`
3. Build and run it: `rs-build && rs-run`

### For TypeScript development:
1. Create a new directory: `mkdir ts-project && cd ts-project`
2. Initialize a project: `npm init -y`
3. Create a tsconfig.json: `tsc --init`
4. Create and run a TypeScript file: `ts-run your-file.ts`

### For TinyGo development:
1. Create a new directory: `mkdir tinygo-project && cd tinygo-project`
2. Create a new Go file: `touch main.go`
3. Edit the file with a simple Go program:
   ```go
   package main
   
   import "fmt"
   
   func main() {
       fmt.Println("Hello, TinyGo!")
   }
   ```
4. Build and run it: `tgo-build -o program main.go && ./program`
5. Build for WebAssembly: `tgo-wasm -o program.wasm -target wasm main.go`

You can use these tools in conjunction with XTP and MCP.run to build plugins and integrate with servlets.
