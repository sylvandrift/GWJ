extends Node2D
@onready var tile_map = $"../TileMap"
var astar_grid: AStarGrid2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	astar_grid = AStarGrid2D.new()
	astar_grid.region = tile_map.get_used_rect()
	astar_grid.cell_size = Vector2(16, 16)
	astar_grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_NEVER
	astar_grid.update()
	
func _input(event):
	if event.is_action_pressed("move") == false:
		return
