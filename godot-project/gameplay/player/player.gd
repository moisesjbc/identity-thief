extends KinematicBody2D


export var speed = 500
var can_swap = true
var current_identity_index = -1
var original_glboal_position


func _ready():
	original_glboal_position = global_position


func _process(delta):
	var velocity = Vector2.ZERO
	
	if Input.is_action_pressed("ui_left"):
		velocity.x = -1
	elif Input.is_action_pressed("ui_right"):
		velocity.x = 1
		
	if Input.is_action_pressed("ui_up"):
		velocity.y = -1
	elif Input.is_action_pressed("ui_down"):
		velocity.y = 1
		
	var collision = move_and_collide(speed * velocity * delta)
	if collision and collision.collider.is_in_group("npc"):
		swap(collision.collider)


func swap(npc):
	if can_swap:
		can_swap = false
		
		var npc_sprite = npc.get_node("skeleton")
		var player_sprite = get_node("skeleton")
		
		$swap_timer.start()
		npc.remove_child(npc_sprite)
		remove_child(player_sprite)
		
		npc.add_child(player_sprite)
		add_child(npc_sprite)
		
		npc.go_back()
		
		current_identity_index = npc.get_index()


func _on_timer_timeout():
	can_swap = true


func reset():
	global_position = original_glboal_position
	current_identity_index = -1
