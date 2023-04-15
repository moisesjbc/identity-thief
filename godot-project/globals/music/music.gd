extends Node


func _ready():
	print("PLAYING MENU")
	play_menu_music()


func play_menu_music():
	$menu.play()
	$gameplay.stop()


func play_gameplay_music():
	$menu.stop()
	$gameplay.play()
