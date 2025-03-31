mod pdk;

use extism_pdk::*;
use pdk::*;

// Called when the tool is invoked.
// If you support multiple tools, you must switch on the input.params.name to detect which tool is being called.
pub(crate) fn call(_input: types::CallToolRequest) -> Result<types::CallToolResult, Error> {
    let name = _input
        .params
        .arguments
        .as_ref()
        .and_then(|args| args.get("name"))
        .and_then(|name| name.as_str())
        .ok_or_else(|| Error::msg("Argument `name` must be provided"))?;

    Ok(types::CallToolResult {
        content: vec![types::Content {
            r#type: types::ContentType::Text,
            text: Some(format!("Hello {}!!!", name)),
            annotations: None,
            data: None,
            mime_type: None,
        }],
        is_error: None,
    })
}

// Called by mcpx to understand how and why to use this tool.
// Note: Your servlet configs will not be set when this function is called,
// so do not rely on config in this function
pub(crate) fn describe() -> Result<types::ListToolsResult, Error> {
    Ok(types::ListToolsResult {
        tools: vec![types::ToolDescription {
            name: "greet".to_string(),
            description: "A very simple tool to provide a greeting".to_string(),
            input_schema: serde_json::json!({
                "type": "object",
                "properties": {
                    "name": {
                        "type": "string",
                        "description": "the name of the person to greet"
                    }
                },
                "required": ["name"]
            })
            .as_object()
            .unwrap()
            .clone(),
        }],
    })
}
