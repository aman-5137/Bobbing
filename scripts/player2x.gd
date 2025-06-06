extends CharacterBody2D

const SPEED = 260.0
const JUMP_VELOCITY = -450.0
#----------------------------------------------------------------------
#-----------------------------------------------------------------------

@onready var player_sound: AnimationPlayer = $PlayerSound
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		player_sound.play("jump")
		velocity.y = JUMP_VELOCITY
		
	
	

	var direction := Input.get_axis("move_left", "move_right")
	

	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
		
	
	
	
	
		
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")
	
	else:
		animated_sprite_2d.play("jump")	
	
	
	
	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	

	move_and_slide()
	
	
	
	
	
	
	
	
	
	
	
	
	
