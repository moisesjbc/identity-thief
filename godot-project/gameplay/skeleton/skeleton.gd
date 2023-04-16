extends Node2D


var current_identity_id


func _ready():
	set_random_identity()


func clone_from(source_skeleton):
	set_identity_by_id(source_skeleton.get_identity_id())


func get_identity_id():
	return current_identity_id

func set_identity_id(identity_id):
	current_identity_id = identity_id

func set_random_identity():
	randomize()

	var new_identity_id = ""
	
	for body_part in get_children():
		var random_child_index = randi() % body_part.get_child_count()
		new_identity_id += "#" + str(random_child_index)
	
	new_identity_id = new_identity_id.substr(1)
	set_identity_by_id(new_identity_id)

func set_identity_by_id(new_identity_id):
	current_identity_id = new_identity_id
	
	var identity_tokens = current_identity_id.split("#")
	print("SPLIT " + str(identity_tokens))
	
	for body_section_index in range(0, get_child_count()):
		var body_section = get_child(body_section_index)
		for body_part_index in range(0, body_section.get_child_count()):
			body_section.get_child(body_part_index).visible = (body_part_index == int(identity_tokens[body_section_index]))
