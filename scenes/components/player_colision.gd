extends Area2D

signal level_lost

@onready var enemy = $".."
@onready var sprite = $"../AnimatedSprite2D"
func _on_area_entered(area: Area2D) -> void:
	sprite.show()
	sprite.play("attack")
	

func _on_animated_sprite_2d_animation_finished() -> void:
	if sprite.animation == "attack":
		level_lost.emit
