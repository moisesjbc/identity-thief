extends Node2D

func _ready():
	randomize()
	for body_part in get_children():
		var child_index = randi() % body_part.get_child_count()
		body_part.get_child(child_index).visible = true


func clone_from(source_skeleton):
	for body_section_index in range(0, get_child_count()):
		var body_section = get_child(body_section_index)
		var source_body_section = source_skeleton.get_child(body_section_index)
		for body_part_index in range(0, body_section.get_child_count()):
			body_section.get_child(body_part_index).visible = source_body_section.get_child(body_part_index).visible
