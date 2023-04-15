extends Control


func reset(current_level_index, target_npc_skeleton):
	$label.text = "Current level: " + str(current_level_index)
	$margin_container/vbox_container/skeleton.clone_from(target_npc_skeleton)
