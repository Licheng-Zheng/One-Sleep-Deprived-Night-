extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite_2d = $AnimatedSprite2D


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and Variables.character_level > 0:
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction > 0: 
		animated_sprite_2d.flip_h = false
	elif direction < 0 and Variables.character_level > 1: 
		animated_sprite_2d.flip_h = true
	
	if is_on_floor():
		if direction == 0 or direction == -1 and Variables.character_level < 2: 
			animated_sprite_2d.play("idle")
		else: 
			animated_sprite_2d.play("run")
	else: 
		animated_sprite_2d.play("jump")
	
		
	if direction == 1:
		velocity.x = direction * SPEED
	elif direction == -1 and Variables.character_level > 1: 
		velocity.x = direction * SPEED
	elif direction == 0:
		velocity.x = 0

	move_and_slide()
