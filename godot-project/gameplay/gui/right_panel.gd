extends Control


func reset(current_level_index, target_identity_id):
	$label.text = "Current level: " + str(current_level_index)
	$margin_container/vbox_container/skeleton.set_identity_by_id(target_identity_id)
