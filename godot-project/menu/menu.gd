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
	get_tree().get_root().get_node("music").play_button_select()
	get_tree().change_scene("res://manual/Manual.tscn")



func _on_sfx_button_toggled(button_pressed):
	get_tree().get_root().get_node("music").play_button_select()
	AudioServer.set_bus_mute(AudioServer.get_bus_index("SFX"), button_pressed)


func _on_music_button_toggled(button_pressed):
	get_tree().get_root().get_node("music").play_button_select()
	AudioServer.set_bus_mute(AudioServer.get_bus_index("Music"), button_pressed)


func _on_TextureButton_pressed():
	get_tree().get_root().get_node("music").play_button_select()
	get_tree().change_scene("res://credits_menu/credits_menu.tscn")
