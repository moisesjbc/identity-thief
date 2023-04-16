extends EntityWithIdentity


export var speed = 500
var can_swap = true
var original_glboal_position
var looking_left = true


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

	if looking_left and velocity.x > 0:
		looking_left = false
		apply_scale(Vector2(-1, 1))
	elif not looking_left and velocity.x < 0:
		looking_left = true
		apply_scale(Vector2(-1, 1))
		
	var collision = move_and_collide(speed * velocity * delta)
	if collision and collision.collider.is_in_group("npc"):
		swap(collision.collider)


func swap(npc):
	if can_swap:
		can_swap = false
		$swap_timer.start()
		$oof.play()
		
		npc.go_back()
		
		var player_identity_id = get_identity_id()
		var npc_identity_id = npc.get_identity_id()
		
		set_identity_by_id(npc_identity_id)
		npc.set_identity_by_id(player_identity_id)
		
		get_tree().get_root().get_node("statistics").n_swaps = get_tree().get_root().get_node("statistics").n_swaps + 1
		print("SWAP to " + str(player_identity_id))


func _on_timer_timeout():
	can_swap = true


func reset():
	global_position = original_glboal_position
	set_identity_by_id("1#2#0#2")
