extends Area2D

var remove_self_delay = 2
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().create_timer(remove_self_delay).timeout.connect(self.queue_free)
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2(2, 2), float(remove_self_delay * 2) / 3.0)
	tween.tween_property(self, "scale", Vector2(0.1, 0.1), float(remove_self_delay) / 3.0)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var tween = create_tween().set_parallel(true)\
								.set_trans(Tween.TRANS_CIRC)\
								.set_ease(Tween.EASE_IN_OUT)
	var added_any = false
	var suck_time = .7
	for node in get_overlapping_bodies():
		if not node.is_being_sucked:
			tween.parallel().tween_property(node, "global_position", 
										self.global_position, suck_time)
			added_any = true
			node.is_being_sucked = true
	if not added_any:
		tween.kill()
