extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$police_siren.play()
	get_node("CenterContainer/TextureRect/LevelCount").text = str(get_tree().get_root().get_node("statistics").n_levels)
	get_node("CenterContainer/TextureRect/SwapCount").text = str(get_tree().get_root().get_node("statistics").n_swaps)
	print("n_levels " + str(get_tree().get_root().get_node("statistics").n_levels))
	print("n_swaps " + str(get_tree().get_root().get_node("statistics").n_swaps))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_HomeButton_pressed():
	get_tree().change_scene("res://menu/menu.tscn")


func _on_RestartButton_pressed():
	get_tree().change_scene("res://gameplay/main/main.tscn")
