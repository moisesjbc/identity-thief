extends Node2D

func _ready():
	print("READY")
	randomize()
	for body_part in get_children():
		var child_index = randi() % body_part.get_child_count()
		body_part.get_child(child_index).visible = true
