extends KinematicBody2D

export var speed = 300
var velocity = Vector2.ZERO

var colors = [
	Color.orange,
	Color.green,
	Color.blue,
	Color.red
]

func _ready():
	randomize()
	
	velocity.x = -50 + randi() % 100
	velocity.y = -50 + randi() % 100
	$sprite.modulate = colors[randi() % len(colors)]

func _process(delta):
	var collision = move_and_collide(speed * velocity.normalized() * delta)
	if collision:
		go_back()
		if collision.collider.is_in_group("player"):
			collision.collider.swap(self)


func go_back():
	velocity.x = -velocity.x
	velocity.y = -velocity.y
