extends Area2D

signal player_reached_door

func _on_door_body_entered(body):
	if body.is_in_group("player"):
		emit_signal("player_reached_door")
