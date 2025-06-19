extends HBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	Signalbus.emit_signal("Multi_shot")
	$"../../AnimationPlayer".play("Exit level")
	queue_free()


func _on_button_2_pressed() -> void:
	Signalbus.emit_signal("More_Ammo")
	$"../../AnimationPlayer".play("Exit level")
	queue_free()


func _on_button_3_pressed() -> void:
	Signalbus.emit_signal("Bigger_light")
	$"../../AnimationPlayer".play("Exit level")
	queue_free()
