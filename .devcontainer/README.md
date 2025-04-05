# Development Container Configuration

This directory contains configuration files for Visual Studio Code's Dev Containers feature.

## Container Image

All development environments use a shared container image that includes:

- Rust with WASM targets
- Go and TinyGo
- Node.js
- Python with uv
- Extism JS/Python PDKs
- XTP CLI

## Usage

To use a specific language environment:

1. Open the project in VS Code
2. Click on the green Remote Containers icon in the bottom left
3. Select "Reopen in Container"
4. Choose the language environment you want (Go, Rust, TypeScript)

## Custom Configuration

Each language environment has specific VS Code extensions and settings to optimize the development experience.

## CI/CD Integration

The same container image is used in GitHub Actions workflows for consistent build environments.