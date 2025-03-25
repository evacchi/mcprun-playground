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
    clang \
    xz-utils \
    binaryen

# Install TinyGo
RUN curl -L -o tinygo.tar.gz https://github.com/tinygo-org/tinygo/releases/download/v0.30.0/tinygo_0.30.0_amd64.tar.gz \
    && tar -C /usr/local -xzf tinygo.tar.gz \
    && rm tinygo.tar.gz

# Set up shell configuration
COPY .devcontainer/bashrc-additions.sh /tmp/
RUN cat /tmp/bashrc-additions.sh >> /home/node/.bashrc && rm /tmp/bashrc-additions.sh
