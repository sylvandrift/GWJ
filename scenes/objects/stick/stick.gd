extends Area2D

signal stickbreak

func _on_area_entered(area: Area2D) -> void:
	emit_signal("stickbreak")
