// Note: run `go doc -all` in this package to see all of the types and functions available.
// ./pdk.gen.go contains the domain types from the host where your plugin will run.
package main

import "errors"

// Called when the tool is invoked.
// If you support multiple tools, you must switch on the input.params.name to detect which tool is being called.
// It takes CallToolRequest as input (The incoming tool request from the LLM)
// And returns CallToolResult (The servlet's response to the given tool call)
func Call(input CallToolRequest) (CallToolResult, error) {
	args := input.Params.Arguments
	if args == nil {
		return CallToolResult{}, errors.New("Arguments must be provided")
	}

	argsMap := args.(map[string]interface{})
	text := "Hello " + argsMap["name"].(string) + "!!!"

	return CallToolResult{
		Content: []Content{{
			Type: ContentTypeText,
			Text: &text,
		}},
	}, nil

}

// Called by mcpx to understand how and why to use this tool.
// Note: Your servlet configs will not be set when this function is called,
// so do not rely on config in this function
// And returns ListToolsResult (The tools' descriptions, supporting multiple tools from a single servlet.)
func Describe() (ListToolsResult, error) {
	return ListToolsResult{
		Tools: []ToolDescription{{
			Name:        "greet",
			Description: "A very simple tool to provide a greeting",
			InputSchema: map[string]interface{}{
				"type": "object",
				"properties": map[string]interface{}{
					"name": map[string]interface{}{
						"type":        "string",
						"description": "the name of the person to greet",
					},
				},
				"required": []string{"name"},
			},
		}},
	}, nil

}
