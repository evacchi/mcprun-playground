# TinyGo WebAssembly Example

This example demonstrates how to use TinyGo to compile Go code to WebAssembly, which can be used in web applications and potentially with MCP.run servlets.

## Files

- `main.go` - The TinyGo source code that will be compiled to WebAssembly
- `index.html` - A web page that loads and interacts with the WebAssembly module

## Building the Example

Build the WebAssembly file:

```bash
# Navigate to this example
cd examples/tinygo-wasm

# Build the WebAssembly module
tgo-wasm -o main.wasm -target wasm main.go
# or use the full command:
# tinygo build -o main.wasm -target wasm main.go
```

## Running the Example

To test the WebAssembly module in the browser, you need to serve the files over HTTP:

```bash
# Using Python's built-in HTTP server
python3 -m http.server

# Or using Node.js with http-server
npx http-server
```

Then visit http://localhost:8000 (or whichever port your server is using) in your browser.

## Important Notes

- The TinyGo WebAssembly runtime is different from the standard Go WebAssembly runtime. It's more lightweight and optimized for size.
- Functions that you want to call from JavaScript must be exported using the `//export` comment directive.
- The `wasm_exec.js` file from TinyGo is required to load the WebAssembly module. This file is different from the standard Go version.

## Integration with MCP.run

This WebAssembly module can be a building block for MCP.run servlets. The small size and fast startup time of TinyGo-generated WebAssembly makes it suitable for serverless environments.

To use this with MCP.run:

1. Build your TinyGo WebAssembly module
2. Upload it as part of your servlet package
3. Load it from your JavaScript code using the WebAssembly API

## Additional Resources

- [TinyGo WebAssembly Documentation](https://tinygo.org/docs/guides/webassembly/)
- [WebAssembly MDN Documentation](https://developer.mozilla.org/en-US/docs/WebAssembly)
