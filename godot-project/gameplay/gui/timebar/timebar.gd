extends Node2D

var total_time
var current_time

signal timeout


func reset(total_time):
	self.total_time = total_time
	self.current_time = total_time


func _process(delta):
	current_time -= delta
	$slider.value = (current_time / total_time) * 100
	if $slider.value <= 0:
		$siren.play()
		emit_signal("timeout")
