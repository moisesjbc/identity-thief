extends Node2D


var current_level = 0


func _ready():
	set_current_level(0)


func set_current_level(new_level):
	current_level = new_level
