extends Node

enum Turn { PLAYER, MONSTER }
var current_turn: Turn = Turn.PLAYER

signal turn_changed(new_turn: Turn)

func start_turn(turn: Turn):
	current_turn = turn
	emit_signal("turn_changed", turn)

	if turn == Turn.MONSTER:
		EnemyManager.start_monster_turn()

func end_turn():
	if current_turn == Turn.PLAYER:
		ToolManager._deselect_tool()
		start_turn(Turn.MONSTER)
	elif current_turn == Turn.MONSTER:
		start_turn(Turn.PLAYER)
