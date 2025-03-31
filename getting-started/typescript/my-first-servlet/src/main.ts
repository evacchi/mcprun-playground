import {
  CallToolRequest,
  CallToolResult,
  ContentType,
  ListToolsResult,
} from "./pdk";

/**
 * Called when the tool is invoked.
 * If you support multiple tools, you must switch on the input.params.name to detect which tool is being called.
 *
 * @param {CallToolRequest} input - The incoming tool request from the LLM
 * @returns {CallToolResult} The servlet's response to the given tool call
 */
export function callImpl(input: CallToolRequest): CallToolResult {
  const name = input.params.arguments?.name;
  if (!name) {
    throw new Error("Argument `name` must be provided");
  }
  return {
    content: [
      {
        type: ContentType.Text,
        text: `Hello ${name}!!!`,
      },
    ],
  };
}

/**
 * Called by mcpx to understand how and why to use this tool.
 * Note: Your servlet configs will not be set when this function is called,
 * so do not rely on config in this function
 *
 * @returns {ListToolsResult} The tools' descriptions, supporting multiple tools from a single servlet.
 */
export function describeImpl(): ListToolsResult {
  return {
    tools: [
      {
        name: "greet",
        description: "A very simple tool to provide a greeting",
        inputSchema: {
          type: "object",
          properties: {
            name: {
              type: "string",
              description: "the name of the person to greet",
            },
          },
          required: ["name"],
        },
      },
    ],
  };
}
