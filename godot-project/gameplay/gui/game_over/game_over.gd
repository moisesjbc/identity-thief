extends CenterContainer


func _ready():
	visible = false
	get_tree().paused = false


func start():
	visible = true
	get_tree().paused = true


func _on_restart_button_pressed():
	get_tree().change_scene("res://gameplay/main/main.tscn")
