extends Node


var current_level = 0
var target_identity_index = 0


func _ready():
	set_current_level(0)


func set_current_level(new_level):
	current_level = new_level

	target_identity_index = $npc_container.get_random_identity_index()
	var target_identity_skeleton = $npc_container.get_identity_skeleton(target_identity_index)
	$gui/right_panel.reset(current_level, target_identity_skeleton)
	$player.reset()
	$door.reset(target_identity_index)


func set_next_level():
	set_current_level(current_level + 1)


func _on_door_right_identity_reached_door():
	set_next_level()


func _on_door_wrong_identity_reached_door():
	$gui/game_over.start()
