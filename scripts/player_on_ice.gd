
extends CharacterBody2D

const SPEED = 130.0
const JUMP_VELOCITY = -300.0
const BASE_FRICTION = 1.0  # Default ground friction
const ICE_FRICTION = 0.9  # Very low friction for ice
const DRIFT_FACTOR = 0.01  # Controls momentum retention

@onready var player_sound: AnimationPlayer = $PlayerSound
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var tilemap: TileMap = null  # Set later

var friction: float = BASE_FRICTION
var is_on_ice: bool = false

func _ready():
	await get_tree().process_frame  
	tilemap = get_parent().get_node_or_null("TileMap")  
func _physics_process(delta: float) -> void:
	if tilemap == null:
		return  
	#      gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	#  jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		player_sound.play("jump")
		velocity.y = JUMP_VELOCITY
	if is_on_floor():
		var tile_position = tilemap.local_to_map(position)
		var tile_data = tilemap.get_cell_tile_data(0, tile_position)

		if tile_data:
			var new_friction = tile_data.get_custom_data("friction")
			if new_friction != null:
				friction = new_friction  
			else:
				friction = BASE_FRICTION
		else:
			friction = BASE_FRICTION
		is_on_ice = friction <= ICE_FRICTION  # ice

	#  movement 
	var direction := Input.get_axis("move_left", "move_right")
	
	#     sprite     direction
	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true

	# Handle animations
	if is_on_floor():
		if direction == 0 and velocity.length() < 10:
			animated_sprite_2d.play("idle")
		else:
			animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("jump")

	# Apply movement and drifting effect
	if direction:
		velocity.x = lerp(velocity.x, direction * SPEED, 0.9 if is_on_ice else 0.05)
		
	else:
		if is_on_ice:
			velocity.x *= DRIFT_FACTOR  # Retain momentum on ice
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED * friction * delta)  # Normal stop

	move_and_slide()
	
