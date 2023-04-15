extends Node2D


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


func _on_door_player_reached_door():
	if $player.current_identity_index == target_identity_index:
		set_next_level()


func set_next_level():
	set_current_level(current_level + 1)
