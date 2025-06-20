extends Area2D

func _on_area_entered(area: Area2D) -> void:
	print('stick is broken')
	#emit_signal("stickbreak")
	#TODO: This should probably just break if it's entered and not send any signals
