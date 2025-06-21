extends Sprite2D

@onready var stick = $"."
@onready var anim = $AnimationPlayer
@onready var colision = $Area2D



func _on_area_2d_area_entered(area: Area2D) -> void:
	print("stick broken")
