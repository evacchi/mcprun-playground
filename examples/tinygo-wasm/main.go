package main

// This is a simple TinyGo program that can be compiled to WebAssembly.
// To build this, run:
// tinygo build -o main.wasm -target wasm ./main.go

import (
	"fmt"
)

// Export the add function to JavaScript
//export add
func add(x, y int) int {
	return x + y
}

// Export a function that returns a string
//export greet
func greet(name string) string {
	return fmt.Sprintf("Hello, %s from TinyGo WebAssembly!", name)
}

// Main is required for the WebAssembly module
func main() {
	// This won't be called when used from JavaScript
	fmt.Println("TinyGo WebAssembly module initialized")
}
