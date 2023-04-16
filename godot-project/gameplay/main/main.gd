extends Node


var current_level = 0
var target_identity_id = 0

# Difficulty parameters

## Time
export var time_initial_value = 15
export var time_first_step_level = 4
export var time_n_levels_per_step = 1
export var time_step = -1

## NPCs
export var n_npcs_initial_value = 5
export var n_npcs_first_step_level = 0
export var n_npcs_n_levels_per_step = 1
export var n_npcs_step = 1

var current_total_time = 15

func _ready():
	set_current_level(0)
	get_tree().get_root().get_node("music").play_gameplay_music()

func compute_difficulty_value(current_level, initial_value, first_step_level, n_levels_per_step, step):
	var difficulty_value = initial_value
	
	if current_level >= first_step_level:
		difficulty_value = int(difficulty_value + step * ((current_level - (first_step_level + 1)) / n_levels_per_step))
	
	return difficulty_value

func set_current_level(new_level):
	current_level = new_level
	
	var current_total_time = compute_difficulty_value(
		current_level,
		time_initial_value,
		time_first_step_level,
		time_n_levels_per_step,
		time_step
	)
	
	var n_npcs = compute_difficulty_value(
		current_level,
		n_npcs_initial_value,
		n_npcs_first_step_level,
		n_npcs_n_levels_per_step,
		n_npcs_step
	)
	
	print("SET level: " + str(current_level))
	print("Number of NPCs: " + str(n_npcs))
	print("Current total time: " + str(current_total_time))
	
	get_tree().get_root().get_node("statistics").n_levels = current_level

	$npc_container.reset(n_npcs)
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
