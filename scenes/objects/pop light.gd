extends Button

var button = false
var mouse_pos:Vector2


func _on_pressed():
	button = true
	print("button pressed")
	
func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		mouse_pos = get_viewport().get_mouse_position()
		print("Mouse Click/Unclick at: ", event.position)
	
		
func _process(delta: float):
	if button==true: 
		if InputEventMouseButton:
			print("will spawn light")
			button = false
		


func _on_toggled(toggled_on: bool) -> void:
	pass # Replace with function body.
