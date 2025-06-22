extends Node2D

var object

func _unhandled_input(event):
	if event.is_action_pressed("click") and ToolManager.current_tool == SignalBus.Tool.STICK:
		object = stick.instantiate()
		add_child(object)
		object.position = get_local_mouse_position() # Set position
		TurnManager.end_turn()

@onready var stick = load("res://scenes/actions/stick/stick.tscn")
@onready var anim = $Wood/alert
@onready var light = $Wood/alert/PointLight2D
@onready var stick_collision = $"../../Enemy/stick colision"
var stick_pos

func _on_stick_colision_area_entered(area: Area2D) -> void:
	anim.play("alert")
	stick_pos = stick_collision.global_position
	light.position = stick_pos

func _on_alert_animation_finished(anim_name: StringName) -> void:
	print("alert anim finished")
	
