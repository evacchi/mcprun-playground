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

# Install TinyGo - we'll fetch and install the latest version during post-create
# This adds the repository for TinyGo
RUN mkdir -p /etc/apt/keyrings && \
    curl -fsSL https://raw.githubusercontent.com/tinygo-org/tinygo/stable/debian/repos/tinygo.gpg | gpg --dearmor -o /etc/apt/keyrings/tinygo.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/tinygo.gpg] http://ppa.launchpad.net/deadsnakes/ppa/ubuntu $(grep UBUNTU_CODENAME= /etc/os-release | cut -d= -f2) main" | tee /etc/apt/sources.list.d/tinygo.list
