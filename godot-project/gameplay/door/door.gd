extends Area2D

signal right_identity_reached_door
signal wrong_identity_reached_door
var target_identity_id

func reset(target_identity_id):
	self.target_identity_id = target_identity_id


func _on_door_body_entered(body):
	if body.is_in_group("player"):
		if body.get_identity_id() == target_identity_id:
			emit_signal("right_identity_reached_door")
			$correct.play()
		else:
			print("DOOR CHECK")
			print("body.get_identity_id() ", body.get_identity_id())
			print("target_identity_id ", target_identity_id)
			emit_signal("wrong_identity_reached_door")
			$wrong.play()
