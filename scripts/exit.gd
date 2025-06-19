extends Area2D

signal level_won
#need to add transition to campfire scene here
func _on_area_entered(area: Area2D) -> void:
	print("level won")
