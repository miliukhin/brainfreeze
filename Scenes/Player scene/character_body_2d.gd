extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var inst = $Inst
@export var SPEED = 420.0
const JUMP_VELOCITY = -400.0
@export var player : CharacterBody2D
var target = Vector2.ZERO
var have_hummer : bool
var have_lighter: bool
var have_sickle: bool
var have_plastick_stick : bool

var item_in_hand = "Hummer"
var item_list =["Hummer", "lighter","sickle","plastick_stick"] 

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var arrow = load("res://Assets/cursor/cursor1.png")
var beam = load("res://Assets/cursor/cursor2.png")

func _ready():
	have_hummer = false
	have_lighter= false
	have_sickle = false
	have_plastick_stick =false
	
	inst.visible = false 
signal facing_position(facing_left : bool)
func _physics_process(delta):
	target = (get_global_mouse_position() - global_position)
	if target.length() > SPEED:
		target = target.normalized() * SPEED
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	var direction = Input.get_axis("move_left", "move_right")
	
	if direction:
		animated_sprite.play("run")
		update_facing_direction()
		velocity.x = direction * SPEED
	#elif Input.is_action_pressed("left_click"):
		#update_facing_direction()
		#animated_sprite.play("run")
		#velocity.x = target.x
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		animated_sprite.play("idle")
	
	move_and_slide()
	#INVENTORY
	invetory()
		
func update_facing_direction():
	if velocity.x > 0:
		animated_sprite.flip_h = false
		inst.position = inst.right_position
		inst.set_rotation(-200)
		inst.flip_h = false
	elif velocity.x < 0:
		inst.flip_h = true
		inst.position = inst.left_position
		inst.set_rotation(200)
		animated_sprite.flip_h = true
		
func invetory():
	if(Input.is_action_just_pressed("inv_1")&&have_hummer):
		item_in_hand = item_list[0]
		inst.frame = 0 
		inst.visible = true 
	elif(Input.is_action_just_pressed("inv_2") && have_lighter):
		item_in_hand = item_list[1]
		inst.frame = 1
		inst.visible = true
	elif(Input.is_action_just_pressed("inv_3") && have_sickle):
		item_in_hand = item_list[2]
		inst.frame = 2
		inst.visible = true
	elif(Input.is_action_just_pressed("inv_4")&& have_plastick_stick):
		item_in_hand = item_list[3]
		inst.frame = 3
		inst.visible = true
	




