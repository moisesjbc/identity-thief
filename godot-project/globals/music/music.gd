extends Node


func _ready():
	play_menu_music()


func play_menu_music():
	$menu.play()
	$gameplay.stop()


func play_gameplay_music():
	$menu.stop()
	$gameplay.play()


func play_button_select():
	$button_select.play()
