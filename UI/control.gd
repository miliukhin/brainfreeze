extends Control
var arrow = load("res://Assets/cursor/cursor1.png")
var beam = load("res://Assets/cursor/cursor2.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_mouse_entered():
	Input.set_custom_mouse_cursor(arrow)
	if Input.is_action_just_pressed("left_click"):
		print("meow")

func _on_area_2d_mouse_exited():
	Input.set_custom_mouse_cursor(beam)
	print("meow left")
	
