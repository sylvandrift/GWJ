extends Button

func _on_pressed() -> void:
	SignalBus.emit_signal("tool_selected", SignalBus.Tool.LIGHT)
