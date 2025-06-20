extends HBoxContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	SignalBus.emit_signal("upgrade_selected", SignalBus.Upgrade.MULTI_SHOT)
	$"../../AnimationPlayer".play("Exit level")
	queue_free()


func _on_button_2_pressed() -> void:
	SignalBus.emit_signal("upgrade_selected", SignalBus.Upgrade.MORE_AMMO)
	$"../../AnimationPlayer".play("Exit level")
	queue_free()


func _on_button_3_pressed() -> void:
	SignalBus.emit_signal("upgrade_selected", SignalBus.Upgrade.BIGGER_LIGHT)
	$"../../AnimationPlayer".play("Exit level")
	queue_free()
