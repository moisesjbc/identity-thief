extends KinematicBody2D

export var speed = 300
var velocity = Vector2.ZERO

func _ready():
	randomize()
	velocity.x = -50 + randi() % 100
	velocity.y = -50 + randi() % 100


func _process(delta):
	var collision = move_and_collide(speed * velocity.normalized() * delta)
	if collision and collision.collider.is_in_group("walls"):
		velocity.x = -velocity.x
		velocity.y = -velocity.y
