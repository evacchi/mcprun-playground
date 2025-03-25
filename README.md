# mcprun-playground

## Development Environment

This repository is configured to work with GitHub Codespaces, providing a fully pre-configured development environment in the cloud.

### Using GitHub Codespaces

1. Click the green "Code" button on the repository page
2. Select the "Codespaces" tab
3. Click "Create codespace on add-devcontainer"

The Codespace will automatically install:
- XTP CLI for working with the XTP plugin system
- MCP.run CLI for searching and using MCP.run servlets
- All necessary dependencies and tools

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

## Getting Started

After your Codespace is set up and you've authenticated with the necessary services, you can start developing your XTP plugins or using MCP.run servlets.
