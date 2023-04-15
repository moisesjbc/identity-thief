extends KinematicBody2D

export var speed = 300
var velocity = Vector2.ZERO
var looking_left = true

func _ready():
	print("NPC READY")
	randomize()
	
	set_direction()

func _process(delta):
	var collision = move_and_collide(speed * velocity.normalized() * delta)
	
	if looking_left and velocity.x > 0:
		looking_left = false
		apply_scale(Vector2(-1, 1))
	elif not looking_left and velocity.x < 0:
		looking_left = true
		apply_scale(Vector2(-1, 1))
	
	if collision:
		go_back()
		if collision.collider.is_in_group("player"):
			collision.collider.swap(self)


func go_back():
	set_direction()

func set_direction():
	velocity.x = -50 + randi() % 100
	velocity.y = -50 + randi() % 100
##	velocity.x = -velocity.x
##	velocity.y = -velocity.y
