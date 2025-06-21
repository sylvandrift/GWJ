extends Area2D

signal level_won

func _on_area_entered(area: Area2D) -> void:
	print("level won")
	level_won.emit()
