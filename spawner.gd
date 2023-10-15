extends Marker2D

@export var leaf_to_spawn: PackedScene
var viewport_bounds: Rect2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	viewport_bounds = get_viewport_rect()
	spawn_leaves()
	
func spawn_leaves():
	if get_child_count() < 8:
		var current_leaf = leaf_to_spawn.instantiate()
		current_leaf.position.x = randi_range(40, viewport_bounds.end.x - 100)
		current_leaf.position.y = randi_range(40, viewport_bounds.end.y - 100)
		add_child(current_leaf)
	
	get_tree().create_timer(randf_range(.2, .8)).timeout.connect(spawn_leaves)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
