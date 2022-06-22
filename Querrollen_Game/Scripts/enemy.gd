extends KinematicBody2D

export (int) var speed = 200
export (int) var gravity = 3000

var velocity = Vector2.ZERO
var is_moving_left = true

func _ready():
	$Sprite.modulate = Color(0.7, 0, 0) # red shade
	$AnimationPlayer.play("Walking")
	

func _physics_process(delta): 
	move_enemy(delta)
	detect_turn_around()
	
func move_enemy(delta):
	# gravity
	velocity.y += gravity * delta
	# limiting the fall speed
	if velocity.y > 1000:
		velocity.y = 1100
	
	velocity.x = -speed	if is_moving_left else speed
	
	# sending the calculated vector to the kinematicBody2D
	velocity = move_and_slide(velocity, Vector2.UP)

func detect_turn_around():
	if not $RayCast2D.is_colliding() and is_on_floor():
		is_moving_left = !is_moving_left
		scale.x = -scale.x
