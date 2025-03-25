FROM mcr.microsoft.com/devcontainers/javascript-node:18

# Install additional OS packages
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    curl \
    wget \
    zip \
    unzip \
    build-essential

# Set up shell configuration
COPY .devcontainer/bashrc-additions.sh /tmp/
RUN cat /tmp/bashrc-additions.sh >> /home/node/.bashrc && rm /tmp/bashrc-additions.sh
