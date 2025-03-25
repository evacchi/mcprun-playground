# XTP CLI shortcuts and helpers
alias xtp-login="~/xtp-login.sh"
alias xtp-apps="xtp apps list"
alias xtp-exts="xtp extension-points list"

# MCP.run shortcuts
alias mcp-login="~/mcp-login.sh"
alias mcp-search="mcpx search"
alias mcp-install="mcpx install"
alias mcp-publish="xtp plugin push"
alias mcp-servlet-lab="npx --yes -p @dylibso/mcpx@latest servlet-lab"

# Rust shortcuts
alias rs-build="cargo build"
alias rs-run="cargo run"
alias rs-test="cargo test"
alias rs-check="cargo check"
alias rs-clippy="cargo clippy"
alias rs-fmt="cargo fmt"
alias rs-watch="cargo watch -x 'check --tests'"
alias rs-wasm="wasm-pack build"

# Go shortcuts
alias go-build="go build"
alias go-run="go run"
alias go-test="go test"
alias go-fmt="go fmt"

# TinyGo shortcuts
alias tgo-build="tinygo build"
alias tgo-run="tinygo run"
alias tgo-build-wasm="tinygo build -target wasm"
alias tgo-build-wasi="tinygo build -target wasi"
alias tgo-build-servlet="tinygo build -target wasi -o dist/plugin.wasm"

# TypeScript shortcuts
alias ts-build="tsc"
alias ts-run="ts-node"
alias ts-watch="tsc --watch"

# WebAssembly helpers
alias wasm-build="xtp plugin build"
alias wasm-call="xtp plugin call"
alias wasm-test="xtp plugin test"

# Set colors for better readability
export PS1="\[\033[01;32m\]\u@dev\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

# Add useful aliases
alias ll="ls -la"
