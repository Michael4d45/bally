extends CharacterBody3D

var gravity = 10

# How fast the player moves in meters per second.
@export var speed = 14
# The downward acceleration when in the air, in meters per second squared.
@export var fall_acceleration = 75

var target_velocity = Vector3.ZERO

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _process(_delta):
	pass

func _physics_process(delta):
	var direction = Vector3.ZERO

	if Input.is_action_pressed("move_right"):
		direction.x += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_back"):
		direction.z += 1
	if Input.is_action_pressed("move_forward"):
		direction.z -= 1

	if direction != Vector3.ZERO:
		direction = direction.normalized()

	var forward = transform.basis.z.normalized()
	var right = transform.basis.x.normalized()
	
	if $Camera.current:
		target_velocity.x = (direction.x * right.x + direction.z * forward.x) * speed
		target_velocity.z = (direction.x * right.z + direction.z * forward.z) * speed
	else:
		target_velocity.x = direction.x * speed
		target_velocity.z = direction.z * speed

	if is_on_floor():
		target_velocity.y = 0
		if Input.is_action_pressed("jump"):
			target_velocity.y = 10
	else:
		target_velocity.y -= fall_acceleration * delta

	# Moving the Character
	velocity = target_velocity

	move_and_slide()

# Define sensitivity for mouse motion
const MOUSE_SENSITIVITY = 0.1

# Store current rotation
var current_rotation = Vector3()

func _input(event):
	if event is InputEventMouseMotion:
		# Update the rotation based on mouse motion
		current_rotation.x -= event.relative.y * MOUSE_SENSITIVITY
		current_rotation.y -= event.relative.x * MOUSE_SENSITIVITY

		# Clamp the vertical rotation to avoid flipping the camera
		current_rotation.x = clamp(current_rotation.x, -90, 90)

		# Apply the new rotation to the character
		rotation_degrees = current_rotation
