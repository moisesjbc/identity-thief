extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_StartButton_pressed():
	get_tree().get_root().get_node("music").play_button_select()
	get_tree().change_scene("res://gameplay/main/main.tscn")


func _on_ExitButton_pressed():
	get_tree().quit()
	
func _on_HowToButton_pressed():
	print("hola")
	get_tree().change_scene("res://manual/Manual.tscn")
