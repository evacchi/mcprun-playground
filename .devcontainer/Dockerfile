FROM mcr.microsoft.com/devcontainers/javascript-node:18

# Install required packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    curl \
    wget \
    zip \
    unzip \
    build-essential \
    pkg-config \
    libssl-dev \
    llvm \
    clang \
    jq \
    git-lfs \
    software-properties-common

# Install Go
RUN curl -OL https://go.dev/dl/go1.24.1.linux-amd64.tar.gz \
    && tar -C /usr/local -xzf go1.24.1.linux-amd64.tar.gz \
    && rm go1.24.1.linux-amd64.tar.gz

# Install XTP CLI
RUN curl -s https://static.dylibso.com/cli/install.sh | bash

# Install TinyGo
RUN curl -LO https://github.com/tinygo-org/tinygo/releases/download/v0.37.0/tinygo_0.37.0_amd64.deb \
    && dpkg -i tinygo_0.37.0_amd64.deb \
    && rm tinygo_0.37.0_amd64.deb

# Install TypeScript tools
RUN npm install -g typescript ts-node nodemon

# Set up environment variables
ENV PATH="/usr/local/go/bin:${PATH}"
ENV GOPATH="/go"
ENV PATH="${PATH}:${GOPATH}/bin"

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV RUSTUP_HOME="/root/.rustup"
ENV CARGO_HOME="/root/.cargo"
ENV PATH="${PATH}:${CARGO_HOME}/bin"

# Configure Rust
RUN source "${CARGO_HOME}/env" && \
    rustup component add clippy rustfmt && \
    cargo install cargo-watch cargo-expand && \
    rustup target add wasm32-wasi