# mcprun-playground

## Development Environment

This repository is configured to work with GitHub Codespaces, providing a fully pre-configured development environment in the cloud.

### Using GitHub Codespaces

1. Click the green "Code" button on the repository page
2. Select the "Codespaces" tab
3. Click "Create codespace on main"

The Codespace will automatically install:
- XTP CLI for working with the XTP plugin system
- MCP.run CLI (mcpx) for searching and using MCP.run servlets
- Rust toolchain with Cargo, Clippy, and WebAssembly targets
- Go with TinyGo for WebAssembly compilation
- TypeScript with compiler and ts-node
- All necessary dependencies and development tools

### Authentication

After your Codespace is ready:

- To log in to MCP.run, run: `~/mcp-login.sh`
- For XTP token setup instructions, run: `~/xtp-login.sh`

### Available Tools and Commands

#### XTP CLI
- `xtp-login` - Show XTP login instructions
- `xtp-apps` - List your XTP applications
- `xtp-exts` - List your XTP extension points

#### MCP.run CLI
- `mcp-login` - Log in to MCP.run
- `mcp-search` - Search for MCP.run servlets
- `mcp-install` - Install MCP.run servlets
- `mcp-publish` - Publish a servlet (uses xtp plugin push)
- `mcp-servlet-lab` - Test a servlet locally

#### WebAssembly Tools
- `wasm-build` - Build a WebAssembly plugin (xtp plugin build)
- `wasm-call` - Call a WebAssembly plugin function (xtp plugin call)
- `wasm-test` - Test a WebAssembly plugin (xtp plugin test)

#### Rust Shortcuts
- `rs-build` - Build Rust project (cargo build)
- `rs-run` - Run Rust project (cargo run)
- `rs-test` - Run tests (cargo test)
- `rs-check` - Check code without building (cargo check)
- `rs-clippy` - Run linter (cargo clippy)
- `rs-fmt` - Format code (cargo fmt)
- `rs-watch` - Watch for changes and check (cargo watch)
- `rs-wasm` - Build as WebAssembly (wasm-pack build)

#### Go Shortcuts
- `go-build` - Build Go project (go build)
- `go-run` - Run Go project (go run)
- `go-test` - Run tests (go test)
- `go-fmt` - Format code (go fmt)

#### TinyGo Shortcuts
- `tgo-build` - Build with TinyGo (tinygo build)
- `tgo-run` - Run with TinyGo (tinygo run)
- `tgo-build-wasm` - Build WebAssembly (tinygo build -target wasm)
- `tgo-build-wasi` - Build WASI (tinygo build -target wasi)
- `tgo-build-servlet` - Build servlet (tinygo build -target wasi -o dist/plugin.wasm)

#### TypeScript Shortcuts
- `ts-build` - Build TypeScript (tsc)
- `ts-run` - Run TypeScript directly (ts-node)
- `ts-watch` - Watch for changes and compile (tsc --watch)

## Getting Started

After your Codespace is set up and you've authenticated with the necessary services, you can start developing:

### For Rust WebAssembly Servlet:
1. Create a servlet using the XTP CLI: 
   ```
   xtp plugin init --feature stub-with-code-samples --path my_servlet
   ```
2. Choose Rust when prompted
3. Navigate to it: `cd my_servlet`
4. Implement the functions in `src/lib.rs`
5. Build it: `wasm-build`
6. Test it: `wasm-call dist/plugin.wasm describe --wasi`

### For Go WebAssembly Servlet:
1. Create a servlet using the XTP CLI:
   ```
   xtp plugin init --feature stub-with-code-samples --path go-servlet
   ```
2. Choose Go when prompted
3. Navigate to it: `cd go-servlet`
4. Implement the functions in `main.go`
5. Build it with TinyGo: `tgo-build-servlet`
6. Test it: `wasm-call dist/plugin.wasm describe --wasi`

### For TypeScript Servlet:
1. Create a servlet using the XTP CLI:
   ```
   xtp plugin init --feature stub-with-code-samples --path ts-servlet
   ```
2. Choose TypeScript when prompted
3. Navigate to it: `cd ts-servlet`
4. Implement the functions in `src/main.ts`
5. Build it: `wasm-build`
6. Test it locally with: `mcp-servlet-lab --servlet dist/plugin.wasm`

You can publish your servlet to MCP.run with `mcp-publish` once you've registered it at [mcp.run/publish](https://mcp.run/publish).

## Sample Go Servlet

A sample Go servlet is provided in `~/samples/go-servlet/main.go`. To build it:

1. Navigate to it: `cd ~/samples/go-servlet`
2. Build it with TinyGo: `tgo-build-servlet`
3. Test it: `wasm-call dist/plugin.wasm describe --wasi`
4. Try calling the greet function: 
   ```
   wasm-call dist/plugin.wasm call --input='{"params":{"name":"greet","arguments":{"name":"YourName"}}}' --wasi
   ```
