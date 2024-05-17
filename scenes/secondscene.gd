extends Node2D

var transition_to = null

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_scene_in_secondscene()


func _on_transition_to_startscene_body_entered(body):
	if body.has_method("player"):
		global.transition_scenes = true
		transition_to = "start_scene"


func _on_transition_to_startscene_body_exited(body):
	if body.has_method("player"):
		global.transition_scenes = false
		transition_to = null

func _on_transition_to_third_scene_body_entered(body):
	if body.has_method("player"):
		global.transition_scenes = true
		transition_to = "third_scene"


func _on_transition_to_third_scene_body_exited(body):
	if body.has_method("player"):
		global.transition_scenes = false
		transition_to = null

func change_scene_in_secondscene():
	if global.transition_scenes == true:
		if global.current_scene == "second_scene":
			if transition_to == "start_scene":
				global.finish_changescenes("start_scene")
				get_tree().change_scene_to_file("res://scenes/world.tscn")
			elif transition_to == "third_scene":
				global.finish_changescenes("third_scene")
				get_tree().change_scene_to_file("res://scenes/third_scene.tscn")
				
				
