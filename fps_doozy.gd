extends CharacterBody3D


const WALK_SPEED = 5.0
var SPEED = WALK_SPEED
const SPRINT_SPEED = 7.0
const JUMP_VELOCITY = 5.0

var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var model = $Head2/Doozy
@onready var animator = $Head2/Doozy/AnimationPlayer

const CAM_SENSITIVITY = 0.03
@onready var camera = $Head2/Camera3D
@onready var camera_arm = $SpringArm3D
@onready var camera_pos = camera.position
var first_person = true

@onready var BASE_FOV = camera.fov 
var FOV_CHANGE = 1.0

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		if SPEED == WALK_SPEED:
				animator.play("Walking0")
	else:
		animator.play("T-Pose")
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
		
	if Input.is_action_pressed("Sprint(1)0"):
		SPEED = SPRINT_SPEED
		FOV_CHANGE = 2.0
	else:
		SPEED = WALK_SPEED
		FOV_CHANGE = 1.0
		
	if Input.is_action_just_pressed("ui_cancel"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
			
	if Input.is_action_just_pressed("change_camera"):
			toggle_camera_parent() # V
			
	var rotate_dir = Input.get_vector("rot_left", "rot_right", "rot_up", "rot_down").normalized()
	if rotate_dir:
		self.rotation.x += rotate_dir.x / 100.0
		self.rotation.z += rotate_dir.y / 100.0
		
	var velocity_clamped = clamp(velocity.length(), 0.5, SPEED * 2)
	var target_fov = BASE_FOV + FOV_CHANGE * velocity_clamped
	camera.fov = lerp(camera.fov, target_fov, delta * 8.0)
	
func toggle_camera_parent():
	var parent = "Head"
	if first_person:
		parent = "SpringArm3D"
		model.visible = true
	var child = camera
	child.get_parent().remove_child(child)
	get_node(parent).add_child(child)
	camera = child
	if not first_person:
		camera.position = camera_pos
		model.visible = false
	first_person = not first_person
	
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	model.visible = false
func _unhandled_input(event):
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if first_person:
			self.rotate_y(-event.relative.x * (CAM_SENSITIVITY / 10.0))
			camera.rotate_x(-event.relative.y * (CAM_SENSITIVITY / 10.0))
			camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-40), deg_to_rad(60))
		else:
			self.rotate_y(-event.relative.x * (CAM_SENSITIVITY / 10.0))
			camera_arm.rotate_x(-event.relative.y * (CAM_SENSITIVITY / 10.0))
			camera_arm.rotation.x = clamp(camera_arm.rotation.x, deg_to_rad(-40), deg_to_rad(60))
