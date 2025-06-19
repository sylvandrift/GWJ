extends Button

var ready_to_spawn = false
@onready var light = $"../PointLight2D"

func _ready() -> void:
	pass
	
func _unhandled_input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed and ready_to_spawn:
		# Spawn animation at mouse position
		light.position = get_local_mouse_position() # Set position
		print(light.position)
		$AnimationPlayer.play("light")
		ready_to_spawn = false # Reset the flag

func _on_pressed() -> void:
	ready_to_spawn = true
