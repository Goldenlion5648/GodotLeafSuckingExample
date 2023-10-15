extends Node2D

@export var sucker : PackedScene
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("click_spot"):
		spawn_sucker(get_viewport().get_mouse_position())

func spawn_sucker(pos):
	var new_sucker: Node2D = sucker.instantiate()
	new_sucker.position = pos
	add_child(new_sucker)
	move_child(new_sucker, 0)

