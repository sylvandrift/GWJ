extends Node

signal level_won
signal level_lost

var level_state : LevelState


func _ready() -> void:
	level_state = GameState.get_level_state(scene_file_path)
	
func _on_exit_level_won() -> void:
	level_won.emit()


func _on_enemy_level_lost() -> void:
	level_lost.emit()
	


func _on_enemy_2_level_lost() -> void:
	level_lost.emit()


func _on_enemy_3_level_lost() -> void:
	level_lost.emit()
