extends Area2D

@onready var enemy = $".."
@onready var sprite = $"../AnimatedSprite2D"
func _on_area_entered(area: Area2D) -> void:
	sprite.show()
	sprite.play("death")
	

func _on_animated_sprite_2d_animation_finished() -> void:
	if sprite.animation == "death":
		EnemyManager.remove_enemy(enemy)
		enemy.queue_free()
