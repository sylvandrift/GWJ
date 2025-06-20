extends Node2D

@export var arrow_scene: PackedScene
@export var shoot_offset: Vector2 = Vector2(16, 0)  # Arrow spawn point relative to bow

func shoot_arrow(target_position: Vector2):
	var arrow = arrow_scene.instantiate()
	get_tree().current_scene.add_child(arrow)

	var dir = (target_position - global_position).normalized()
	arrow.global_position = global_position + dir * shoot_offset.length()
	arrow.direction = dir
	arrow.rotation = dir.angle()

func _process(delta):
	look_at(get_global_mouse_position())

func _unhandled_input(event):
	if event.is_action_pressed("click") and ToolManager.current_tool == SignalBus.Tool.BOW:
		self.shoot_arrow(get_global_mouse_position())
		SignalBus.emit_signal("tool_selected", SignalBus.Tool.NONE)
