extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_scene_in_scene_with_key()


func _on_transition_to_third_scene_body_entered(body):
	if body.has_method("player"):
		global.transition_scenes = true


func _on_transition_to_third_scene_body_exited(body):
	if body.has_method("player"):
		global.transition_scenes = false

func change_scene_in_scene_with_key():
	if global.transition_scenes == true:
		if global.current_scene == "scene_with_key":
			global.finish_changescenes("third_scene")
			get_tree().change_scene_to_file("res://scenes/third_scene.tscn")
