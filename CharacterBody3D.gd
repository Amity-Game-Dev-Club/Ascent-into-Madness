extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 7 
var doublejumps = 1
@onready var particle_effects: = preload("res://particle effects .tscn")
@onready var toes = $grippers
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
		if Input.is_action_just_pressed("ui_up") and doublejumps>0:
			velocity.y = JUMP_VELOCITY
			doublejumps= doublejumps - 1
			# When we use jump we will instantine particles from particle effects 
			var jump_effects = particle_effects.instantiate()
			toes.add_child(jump_effects)
			

	# Handle jump.
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = JUMP_VELOCITY
			doublejumps = 1


	# Get the input direction and handle the movement/deceleration.
	
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * 0
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
