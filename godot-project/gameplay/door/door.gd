extends Area2D

signal right_identity_reached_door
signal wrong_identity_reached_door
var target_identity_index

func reset(target_identity_index):
	self.target_identity_index = target_identity_index


func _on_door_body_entered(body):
	if body.is_in_group("player"):
		if body.current_identity_index == target_identity_index:
			emit_signal("right_identity_reached_door")
			$correct.play()
		else:
			emit_signal("wrong_identity_reached_door")
			$wrong.play()
