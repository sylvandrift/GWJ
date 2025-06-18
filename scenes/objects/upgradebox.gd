extends HBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	Signalbus.emit_signal("upgrade1")
	queue_free()


func _on_button_2_pressed() -> void:
	queue_free()


func _on_button_3_pressed() -> void:
	queue_free()
