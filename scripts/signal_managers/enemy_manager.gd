extends Node

var enemies: Array = []
var active_enemy_count: int = 0

func register_enemy(enemy: Node):
	enemies.append(enemy)

func start_monster_turn():
	active_enemy_count = enemies.size()

func notify_enemy_finished():
	active_enemy_count -= 1
	if active_enemy_count <= 0:
		TurnManager.end_turn()

func remove_enemy(enemy: Node):
	enemies.erase(enemy)
