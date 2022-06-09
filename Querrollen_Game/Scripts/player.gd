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
	if facing_right:
		$Sprite.frame_coords.y = 2
	else:
		$Sprite.frame_coords.y = 3
	get_input()
	velocity.y += gravity * delta
	if velocity.y > 1000:
		velocity.y = 1100
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = jump_speed
