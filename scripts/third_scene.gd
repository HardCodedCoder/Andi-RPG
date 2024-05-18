extends Node2D

var transition_to = null

# Called when the node enters the scene tree for the first time.
func _ready():
	if global.last_scene == "scene_with_key":
		$player.position.x = global.player_exit_scene_with_key_posx
		$player.position.y = global.player_exit_scene_with_key_posy
	elif global.last_scene == "fourth_scene":
		$player.position.x = global.player_exit_fourth_scene_posx
		$player.position.y = global.player_exit_fourth_scene_posy

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_scene_in_third_scene()


func _on_transition_to_second_scene_body_entered(body):
	if body.has_method("player"):
		global.transition_scenes = true
		transition_to = "second_scene"


func _on_transition_to_second_scene_body_exited(body):
	if body.has_method("player"):
		global.transition_scenes = false
		transition_to = null


func _on_transition_to_scene_with_key_body_entered(body):
	if body.has_method("player"):
		global.transition_scenes = true
		transition_to = "scene_with_key"


func _on_transition_to_scene_with_key_body_exited(body):
	if body.has_method("player"):
		global.transition_scenes = false
		transition_to = null


func _on_tansition_to_fourth_scene_body_entered(body):
	if body.has_method("player"):
		global.transition_scenes = true
		transition_to = "fourth_scene"


func _on_tansition_to_fourth_scene_body_exited(body):
	if body.has_method("player"):
		global.transition_scenes = false
		transition_to = null


func change_scene_in_third_scene():
	if global.transition_scenes == true:
		if global.current_scene == "third_scene":
			if transition_to == "second_scene":
				global.finish_changescenes("second_scene")
				get_tree().change_scene_to_file("res://scenes/second_scene.tscn")
			elif transition_to == "scene_with_key":
				global.finish_changescenes("scene_with_key")
				get_tree().change_scene_to_file("res://scenes/scene_with_key.tscn")
			elif transition_to == "fourth_scene":
				global.finish_changescenes("fourth_scene")
				get_tree().change_scene_to_file("res://scenes/fourth_scene.tscn")
