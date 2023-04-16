extends Control


func reset(current_level_index, target_identity_id):
	$banks_label.text = str(current_level_index)
	$marco/skeleton.set_identity_by_id(target_identity_id)
