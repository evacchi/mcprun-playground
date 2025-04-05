FROM mcr.microsoft.com/devcontainers/base:ubuntu

# Install basic dependencies
RUN apt-get update && apt-get install -y \
    curl \
    wget \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install Rust and Cargo
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
SHELL ["/bin/bash", "-c"] 
# Add Rust WASM targets
RUN source "$HOME/.cargo/env" && \
    rustup target add wasm32-unknown-unknown wasm32-wasi wasm32-wasip1

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - \
    && apt-get update \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Install Go
RUN curl -L https://go.dev/dl/go1.24.0.linux-amd64.tar.gz -o go.tar.gz \
    && tar -C /usr/local -xzf go.tar.gz \
    && rm go.tar.gz
ENV PATH="/usr/local/go/bin:${PATH}"

# Install TinyGo
RUN wget https://github.com/tinygo-org/tinygo/releases/download/v0.37.0/tinygo_0.37.0_amd64.deb \
    && dpkg -i tinygo_0.37.0_amd64.deb \
    && rm tinygo_0.37.0_amd64.deb

# Install extism-js
RUN curl -L https://raw.githubusercontent.com/extism/js-pdk/main/install.sh | bash

# Install extism-py and uv
RUN curl -LsSf https://astral.sh/uv/install.sh | sh \
    && curl -Ls https://raw.githubusercontent.com/extism/python-pdk/main/install.sh | bash

# Install just
RUN curl --proto '=https' --tlsv1.2 -sSf https://just.systems/install.sh | bash -s -- --to /usr/local/bin

# Install xtp CLI
RUN curl -L https://static.dylibso.com/cli/install.sh -s | bash

# Setup environment
ENV PATH="/root/.local/bin:${PATH}"
WORKDIR /workspaces/mcprun-playground