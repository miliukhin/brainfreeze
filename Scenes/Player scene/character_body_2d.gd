extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@export var SPEED = 420.0
const JUMP_VELOCITY = -400.0

var target = Vector2.ZERO
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var arrow = load("res://Assets/cursor/arrow.png")
var beam = load("res://Assets/cursor/beam.png")

func _physics_process(delta):
	target = (get_global_mouse_position() - global_position)
	if target.length() > SPEED:
		target = target.normalized() * SPEED
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	
	# Handle Jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	#	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	
	
	
	if direction:
		animated_sprite.play("run")
		update_facing_direction()
		velocity.x = direction * SPEED
	elif Input.is_action_pressed("left_click"):
		update_facing_direction()
		animated_sprite.play("run")
		velocity.x = target.x
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite.play("idle")

	move_and_slide()

func update_facing_direction():
		if velocity.x > 0:
			animated_sprite.flip_h = false
		elif velocity.x < 0:
			animated_sprite.flip_h = true

func _on_area_2d_mouse_entered():
	if Input.is_action_pressed("left_click"):
		print("meow")
	pass # Replace with function body.


func _on_area_2d_input_event(viewport, event, shape_idx):
	Input.set_custom_mouse_cursor(arrow)
	var n = 0
	if Input.is_action_just_pressed("left_click"):
		print("meow")
	
	pass # Replace with function body.


func _on_area_2d_mouse_exited():
	Input.set_custom_mouse_cursor(beam)
	print("meow left")
	pass # Replace with function body.
