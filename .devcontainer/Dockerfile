FROM mcr.microsoft.com/devcontainers/javascript-node:18

# Install additional OS packages
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
    clang

# Set up shell configuration
COPY .devcontainer/bashrc-additions.sh /tmp/
RUN cat /tmp/bashrc-additions.sh >> /home/node/.bashrc && rm /tmp/bashrc-additions.sh

RUN curl -LO https://github.com/tinygo-org/tinygo/releases/download/v0.37.0/tinygo_0.37.0_amd64.deb \
    && dpkg -i tinygo_0.37.0_amd64.deb
    