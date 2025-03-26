# mcp.run playground

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

 
