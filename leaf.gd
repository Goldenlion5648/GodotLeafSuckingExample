extends CharacterBody2D

var suck_time = .6
var viewport_bounds: Rect2
var starting_spot:Vector2


var is_being_sucked = false:
	get:
		return is_being_sucked
	set(new_val):
		if new_val == true:
			get_tree().create_timer(suck_time).timeout.connect(on_suck_complete)
		is_being_sucked = new_val

func on_suck_complete():
	Globals.total_leaves_sucked += 1
	Globals.leaf_sucked_up.emit()
	self.queue_free()
	

func _ready() -> void:
	self.velocity = Vector2(randf_range(-1.3, 1.3), randf_range(-1.3, 1.3)) * 20
	starting_spot = self.position
	viewport_bounds = get_viewport_rect()
	self.rotation_degrees = randi_range(-180, 180)


func _physics_process(delta: float) -> void:
	move_and_slide()

func _process(delta: float) -> void:
	if not viewport_bounds.encloses(Rect2(self.global_position, Vector2(5, 5))):
		queue_free()
