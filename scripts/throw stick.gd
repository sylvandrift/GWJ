extends Button

var ready_to_spawn = false
@onready var stick = load("res://scenes/objects/woodstick.tscn")


func _ready() -> void:
	pass
	
func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and ready_to_spawn:
		# Spawn animation at mouse position
		var object = stick.instantiate()
		add_child(object)
		object.position = get_local_mouse_position() # Set position
		ready_to_spawn = false # Reset the flag

func _on_pressed() -> void:
	ready_to_spawn = true
