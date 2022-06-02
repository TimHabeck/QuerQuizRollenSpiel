extends KinematicBody2D


var velocity : Vector2
var speed := 500

func _process(delta):
	#Basic movement system
	var input_vector =  Vector2.ZERO
	input_vector.x = Input.get_action_strength('ui_right') - Input.get_action_strength('ui_left')
	input_vector.y = Input.get_action_strength('ui_down') - Input.get_action_strength('ui_up')
	velocity = input_vector.normalized() * speed
		
	velocity = move_and_slide(velocity)

	if input_vector != Vector2.ZERO:
		if $AnimationPlayer.get_current_animation() != 'Walking':
		   $AnimationPlayer.stop()
		   $AnimationPlayer.play('Walking')
	else:
		if $AnimationPlayer.get_current_animation() != 'Idle':
		   $AnimationPlayer.stop()
		   $AnimationPlayer.play('Idle')

	var direction = -int(input_vector.normalized().angle()*(4/PI)) + 2
	
	if direction > 7:
		direction -= 8
	if direction < 0:
		direction += 8
	
	if input_vector != Vector2.ZERO:
		$Sprite.frame_coords.y = direction
	
	
		
