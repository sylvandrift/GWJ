extends Area2D

signal kill_enemy
var direction: Vector2 = Vector2.ZERO
var speed: float = 600.0

func _physics_process(delta):
	position += direction * speed * delta



func _on_area_entered(area: Area2D) -> void:
	kill_enemy.emit()
