extends Button

@onready var stick = load("res://scenes/objects/woodstick.tscn")

func _ready() -> void:
	pass
	
func _unhandled_input(event):
	if event.is_action_pressed("click") and ToolManager.current_tool == SignalBus.Tool.STICK:
		# Spawn animation at mouse position
		var object = stick.instantiate()
		add_child(object)
		object.position = get_local_mouse_position() # Set position
		SignalBus.emit_signal("tool_selected", SignalBus.Tool.NONE)

func _on_pressed() -> void:
	SignalBus.emit_signal("tool_selected", SignalBus.Tool.STICK)
