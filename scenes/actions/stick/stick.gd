extends Node2D

@onready var stick = load("res://scenes/actions/stick/stick.tscn")

func _unhandled_input(event):
	if event.is_action_pressed("click") and ToolManager.current_tool == SignalBus.Tool.STICK:
		print('inside stick action')
		# Spawn animation at mouse position
		var object = stick.instantiate()
		add_child(object)
		object.position = get_local_mouse_position() # Set position
		SignalBus.emit_signal("tool_selected", SignalBus.Tool.NONE)
