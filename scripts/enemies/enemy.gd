extends Node2D
@onready var tile_map = $"../TileMap"
@onready var player = $"../Player"
var astar_grid: AStarGrid2D
var current_id_path: Array[Vector2i]
var target_position: Vector2
var is_moving: bool
var last_player_tile_position: Vector2i
var timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	astar_grid = AStarGrid2D.new()
	astar_grid.region = tile_map.get_used_rect()
	astar_grid.cell_size = Vector2(16, 16)
	astar_grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	astar_grid.update()
	$Sprite2D.visible=false
	
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
 

#Making it so when poplight hitbox touches monster hitbox it will become 
#visible for set time and then invisible again
func _on_area_2d_area_entered(area: Area2D) -> void:
	print("monster found!")
	$Sprite2D.visible=true
	$"Sprite2D/visibility timer".start()



func _on_timer_timeout() -> void:
	$Sprite2D.visible=false
