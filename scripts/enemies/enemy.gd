extends Node2D
@onready var tile_map = $"../Tilemap/Walkable map"
@onready var player = $"../Player"
var astar_grid: AStarGrid2D
var current_id_path: Array[Vector2i]
var target_position: Vector2
var is_moving: bool
var last_player_tile_position: Vector2i
var timer
signal level_lost

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	EnemyManager.register_enemy(self)
	astar_grid = AStarGrid2D.new()
	astar_grid.region = tile_map.get_used_rect()
	astar_grid.cell_size = Vector2(32, 32)
	astar_grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	astar_grid.update()
	$AnimatedSprite2D.hide()
	
	for x in tile_map.get_used_rect().size.x:
		for y in tile_map.get_used_rect().size.y:
			var tile_position = Vector2i(
				x + tile_map.get_used_rect().position.x,
				y + tile_map.get_used_rect().position.y
			)
			
			var tile_data = tile_map.get_cell_tile_data(0, tile_position)
			
			if tile_data == null or tile_data.get_custom_data("walkable") == false:
				astar_grid.set_point_solid(tile_position)
		
func _physics_process(delta):
	if TurnManager.current_turn != TurnManager.Turn.MONSTER:
		return
		
	var player_tile_pos = tile_map.local_to_map(player.global_position)
	
	if player_tile_pos != last_player_tile_position or current_id_path.is_empty():
		last_player_tile_position = player_tile_pos
		var start_pos = tile_map.local_to_map(global_position)
		var id_path = astar_grid.get_id_path(start_pos, player_tile_pos).slice(1)
		if id_path.size() > 0:
			current_id_path = id_path
			is_moving = true
	
	if current_id_path.is_empty():
		is_moving = false
		return

	if is_moving:
		var target_pos = tile_map.map_to_local(current_id_path.front())
		global_position = global_position.move_toward(target_pos, 100 * delta)
		
		if global_position.distance_to(target_pos) < 1.0:
			global_position = target_pos
			current_id_path.pop_front()
			
			if randi() % 3 == 0:
				print("A monster has left a footprint")
        
			EnemyManager.notify_enemy_finished()
 

#Making it so when poplight hitbox touches monster hitbox it will become 
#visible for set time and then invisible again

func _on_timer_timeout() -> void:
	$AnimatedSprite2D.hide()

func _on_light_colision_area_entered(area: Area2D) -> void:
	print("monster found!")
	$AnimatedSprite2D.show()
	$"AnimatedSprite2D/visibility timer".start()

#monster touches player leads to level lost screen

func _on_player_colision_area_entered(area: Area2D) -> void:
	$AnimatedSprite2D.play("attack")

func _on_animated_sprite_2d_animation_finished() -> void:
	if $AnimatedSprite2D.animation == "attack":
		level_lost.emit()
#monster touches stick shows red area
