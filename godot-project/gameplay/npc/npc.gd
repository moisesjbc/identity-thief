extends KinematicBody2D

export var speed = 300
var velocity = Vector2.ZERO

func _ready():
	print("NPC READY")
	randomize()
	
	velocity.x = -50 + randi() % 100
	velocity.y = -50 + randi() % 100

func _process(delta):
	var collision = move_and_collide(speed * velocity.normalized() * delta)
	if collision:
		go_back()
		if collision.collider.is_in_group("player"):
			collision.collider.swap(self)


func go_back():
	velocity.x = -velocity.x
	velocity.y = -velocity.y
