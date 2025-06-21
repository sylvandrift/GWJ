extends Node

# Tracks the currently selected tool from SignalBus
var current_tool: SignalBus.Tool = SignalBus.Tool.NONE

func _ready() -> void:
	# Connect to the global signal when a tool is selected
	SignalBus.connect("tool_selected", self._on_tool_selected)

func _on_tool_selected(tool: SignalBus.Tool) -> void:
	current_tool = tool
	print("ToolManager: current tool set to", tool)
	
func _deselect_tool() -> void:
	SignalBus.emit_signal("tool_selected", SignalBus.Tool.NONE)
