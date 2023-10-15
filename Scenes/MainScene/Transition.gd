extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func loadSceneOne():
	get_tree().change_scene_to_file("res://node/test.tscn")
	$AnimationPlayer.play("fade out")
	await $AnimationPlayer.animation_finished

func _on_body_entered(body):
	$AnimationPlayer.play("fade in")
	await $AnimationPlayer.animation_finished
	loadSceneOne()
