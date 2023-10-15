extends Area2D

var arrow = load("res://Assets/cursor/cursor1.png")
var beam = load("res://Assets/cursor/cursor2.png")


@export var player :CharacterBody2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass

func _on_input_event(viewport, event, shape_idx):
	Input.set_custom_mouse_cursor(arrow)
	if Input.is_action_just_pressed("left_click") && abs(abs(player.position.x) - abs(get_global_mouse_position().x)) < 200:
		if get_parent().name == "Hummer" && get_parent().visible == true:
			get_parent().visible = false
			player.have_hummer = true

func _on_mouse_entered():
	if Input.is_action_pressed("left_click"):
		print("meow")


func _on_mouse_exited():
	Input.set_custom_mouse_cursor(beam)
	print("meow left")



			
