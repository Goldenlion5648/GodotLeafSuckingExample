extends Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Globals.leaf_sucked_up.connect(update_text)

func update_text():
	self.text = "Score: %d" % Globals.total_leaves_sucked 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
