extends Node


var current_level = 0
var target_identity_id = 0
var current_total_time = 15


func _ready():
	set_current_level(0)
	get_tree().get_root().get_node("music").play_gameplay_music()
	


func set_current_level(new_level):
	current_level = new_level
	get_tree().get_root().get_node("statistics").n_levels = current_level

	$npc_container.reset(5 + current_level)
	target_identity_id = $npc_container.get_random_identity_id()
	
	$gui/right_panel.reset(current_level, target_identity_id)
	$player.reset()
	$door.reset(target_identity_id)
	$gui/timebar.reset(current_total_time)
	$backgrounds.reset(current_level)


func set_next_level():
	set_current_level(current_level + 1)


func _on_door_right_identity_reached_door():
	set_next_level()


func _on_timebar_timeout():
	get_tree().change_scene("res://game_over/GameOver.tscn")
