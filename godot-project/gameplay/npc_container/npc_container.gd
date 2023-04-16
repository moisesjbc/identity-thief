extends Node2D

var npc_scene = preload("res://gameplay/npc/npc.tscn")

func reset(n_npcs):
	for npc in get_children():
		remove_child(npc)
		npc.free()
	
	for i in range(0, n_npcs):
		var npc = npc_scene.instance()
		npc.global_position = Vector2(
			100 + randi() % 1000,
			100 + randi() % 700
		)
		add_child(npc)


func get_random_identity_id():
	var random_identity_index = randi() % get_child_count()
	return get_identity_skeleton(random_identity_index).get_identity_id()


func get_identity_skeleton(identity_index):
	return get_child(identity_index).get_node("skeleton")
