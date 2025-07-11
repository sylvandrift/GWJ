extends Node2D
@onready var tile_map = $"../Tilemap/Walkable map"
var astar_grid: AStarGrid2D
var current_id_path: Array[Vector2i]
var target_position: Vector2
var is_moving: bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	astar_grid = AStarGrid2D.new()
	astar_grid.region = tile_map.get_used_rect()
	astar_grid.cell_size = Vector2(32, 32)
	astar_grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	astar_grid.update()
	
	for x in tile_map.get_used_rect().size.x:
		for y in tile_map.get_used_rect().size.y:
			var tile_position = Vector2i(
				x + tile_map.get_used_rect().position.x,
				y + tile_map.get_used_rect().position.y
			)
			
			var tile_data = tile_map.get_cell_tile_data(0, tile_position)
			
			if tile_data == null or tile_data.get_custom_data("walkable") == false:
				astar_grid.set_point_solid(tile_position)
	
func _unhandled_input(event):
	if event.is_action_pressed("click") and ToolManager.current_tool == SignalBus.Tool.WALK:
		var id_path
		
		if is_moving:
			id_path = astar_grid.get_id_path(
				tile_map.local_to_map(target_position),
				tile_map.local_to_map(get_global_mouse_position())
			)
		else:
			id_path = astar_grid.get_id_path(
				tile_map.local_to_map(global_position),
				tile_map.local_to_map(get_global_mouse_position())
			).slice(1)
		
		if id_path.size() > 0:
			current_id_path = id_path if EnemyManager.enemies.is_empty() else ([id_path[0]] as Array[Vector2i])

		
func _physics_process(delta):
	if current_id_path.is_empty():
		return
		
	if is_moving == false:
		
		target_position = tile_map.map_to_local(current_id_path.front())
		var movement_delta = target_position - global_position

		if abs(movement_delta.x) > abs(movement_delta.y):
			if movement_delta.x > 0:
				print("Player is walking right")
			else:
				print("Player is walking left")
		else:
			if movement_delta.y > 0:
				print("Player is walking down")
			else:
				print("Player is walking up")

		is_moving = true
		
	var target_position = tile_map.map_to_local(current_id_path.front())
	
	global_position = global_position.move_toward(target_position, 1)
	
	if global_position == target_position:
		current_id_path.pop_front()
		is_moving = false
		TurnManager.end_turn()
