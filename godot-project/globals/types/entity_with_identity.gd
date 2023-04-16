class_name EntityWithIdentity

extends KinematicBody2D


func get_identity_id():
	return get_node("skeleton").get_identity_id()


func set_random_identity():
	return get_node("skeleton").set_random_identity()


func set_identity_by_id(new_identity_id):
	get_node("skeleton").set_identity_by_id(new_identity_id)
