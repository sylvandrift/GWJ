extends Node2D

@onready var light = $PointLight2D
	
func _unhandled_input(event):
	if event.is_action_pressed("click") and ToolManager.current_tool == SignalBus.Tool.LIGHT:
		# Spawn animation at mouse position
		light.global_position = get_global_mouse_position() # Set position
		print(light.global_position)
		$AnimationPlayer.play("light")
		SignalBus.emit_signal("tool_selected", SignalBus.Tool.NONE)
