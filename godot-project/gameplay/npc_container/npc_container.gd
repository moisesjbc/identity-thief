extends Node2D


func get_random_identity_index():
	return randi() % get_child_count()


func get_identity_skeleton(identity_index):
	return get_child(identity_index).get_node("skeleton")
