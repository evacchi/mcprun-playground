#!/bin/bash
wget https://github.com/tinygo-org/tinygo/releases/download/v0.37.0/tinygo_0.37.0_amd64.deb 
sudo dpkg -i tinygo_0.37.0_amd64.deb

curl -s https://static.dylibso.com/cli/install.sh | bash
