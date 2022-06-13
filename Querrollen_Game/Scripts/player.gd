extends KinematicBody2D

export (int) var speed = 500
export (int) var jump_speed = -1200
export (int) var gravity = 3000

var velocity = Vector2.ZERO
var facing_right = true
	
func get_input():
	velocity.x = 0
	if Input.is_action_pressed("right"):
		velocity.x += speed
		facing_right = true
		$AnimationPlayer.play('Walking')
	elif Input.is_action_pressed("left"):
		velocity.x -= speed
		facing_right = false
		$AnimationPlayer.play('Walking')
	else:
		$AnimationPlayer.play('Idle')
	
func _physics_process(delta): 
	# turn the sprite to the right direction
	if facing_right:
		$Sprite.frame_coords.y = 2
	else:
		$Sprite.frame_coords.y = 3
	get_input()
	velocity.y += gravity * delta
	
	# limiting the fall speed
	if velocity.y > 1000:
		velocity.y = 1100
		
	# sending the calculated vector to the kinematicBody2D
	velocity = move_and_slide(velocity, Vector2.UP)
	
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jump_speed

func change_jump_speed(amount):
	jump_speed -= amount

func change_light_size(amount):
	var light = find_node("PlayerLight")
	var size = light.get_texture_scale()
	light.set_texture_scale(size+amount)
	
