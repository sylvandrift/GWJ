extends Button

@onready var light = $"../PointLight2D"
	
func _unhandled_input(event):
	if event.is_action_pressed("click") and ToolManager.current_tool == SignalBus.Tool.LIGHT:
		# Spawn animation at mouse position
		light.position = get_local_mouse_position() # Set position
		print(light.position)
		$AnimationPlayer.play("light")
		SignalBus.emit_signal("tool_selected", SignalBus.Tool.NONE)

func _on_pressed() -> void:
	SignalBus.emit_signal("tool_selected", SignalBus.Tool.LIGHT)
