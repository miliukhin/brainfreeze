extends Area2D

@export var player :CharacterBody2D
@export_file var next_scene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_input_event(viewport, event, shape_idx):
	if Input.is_action_just_pressed("left_click") && abs(abs(player.position.x) - abs(get_global_mouse_position().x)) < 150:
		get_tree().change_scene_to_file(next_scene)
