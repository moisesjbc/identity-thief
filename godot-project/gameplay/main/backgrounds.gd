extends Node2D


func reset(current_level):
	for i in range(0, get_child_count()):
		var current_background = get_child(i)
		current_background.visible = (current_level % get_child_count()) == i
