# XTP CLI shortcuts and helpers
alias xtp-login="~/xtp-login.sh"
alias xtp-apps="xtp apps list"
alias xtp-exts="xtp extension-points list"

# MCP.run shortcuts
alias mcp-login="~/mcp-login.sh"
alias mcp-search="mcprun search"
alias mcp-install="mcprun install"

# Rust shortcuts
alias rs-build="cargo build"
alias rs-run="cargo run"
alias rs-test="cargo test"
alias rs-check="cargo check"
alias rs-clippy="cargo clippy"
alias rs-fmt="cargo fmt"
alias rs-watch="cargo watch -x 'check --tests'"

# TypeScript shortcuts
alias ts-build="tsc"
alias ts-run="ts-node"
alias ts-watch="tsc --watch"

# Set colors for better readability
export PS1="\[\033[01;32m\]\u@dev\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ "

# Add useful aliases
alias ll="ls -la"
