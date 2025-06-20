extends Area2D

var direction: Vector2 = Vector2.ZERO
var speed: float = 600.0

func _physics_process(delta):
	position += direction * speed * delta
