extends Node

signal Multi_shot
signal More_Ammo
signal Bigger_light
signal sticktrigger(bool)
var stick

func _ready() -> void:
	if stick == true:
		emit_signal("sticktrigger", true)

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
