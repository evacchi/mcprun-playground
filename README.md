# mcp.run playground

This will be an interactive session! You don't **have** to code to follow along, but if you want, make sure you have:

- a GitHub account (duh, but just saying)
- mcp.run account (you can use the GH account and create it on the spot)
- the [XTP CLI installed](https://docs.xtp.dylibso.com/docs/cli/) (if you want to build servlets) 
- recommended for interactive use: an account with Claude, Claude Desktop installed
- useful for Tasks: an account with Claude (Anthropic Console) and/or OpenAI
- you can also use Ollama/your favorite MCP client (if you like to live on the bleeding edge)

## Development Environment

This repository is configured to work with GitHub Codespaces, providing a fully pre-configured development environment in the cloud.

### Using GitHub Codespaces

1. Click the green "Code" button on the repository page
2. Select the "Codespaces" tab
3. Click "Create codespace on main"

The Codespace will automatically install:
- [XTP CLI for working with the XTP plugin system](https://docs.xtp.dylibso.com/docs/cli/) (to create your own servlets)
- Rust toolchain with Cargo, Clippy, and Rustfmt
- TinyGo to compile Go into WebAssembly
- TypeScript with compiler and ts-node
- All necessary dependencies and development tools

## Getting Started

- `xtp auth login`
- `xtp plugin init`

 
