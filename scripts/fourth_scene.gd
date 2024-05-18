extends Node2D

var transition_to = null

# Called when the node enters the scene tree for the first time.
func _ready():
	if global.last_scene == "end_one":
		$player.position.x = global.player_exit_end_one_posx
		$player.position.y = global.player_exit_end_one_posy
	elif global.last_scene == "end_two":
		$player.position.x = global.player_exit_end_two_posx
		$player.position.y = global.player_exit_end_two_posy
	elif global.last_scene == "boss_room":
		$player.position.x = global.player_exit_boss_room_posx
		$player.position.y = global.player_exit_boss_room_posy

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_scene_in_fourth_scene()


func _on_transition_to_end_one_body_entered(body):
	if body.has_method("player"):
		global.transition_scenes = true
		transition_to = "end_one"


func _on_transition_to_end_one_body_exited(body):
	if body.has_method("player"):
		global.transition_scenes = false
		transition_to = null


func _on_transition_to_end_two_body_entered(body):
	if body.has_method("player"):
		global.transition_scenes = true
		transition_to = "end_two"


func _on_transition_to_end_two_body_exited(body):
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


func _on_transition_to_boss_room_body_entered(body):
	if body.has_method("player"):
		global.transition_scenes = true
		transition_to = "boss_room"


func _on_transition_to_boss_room_body_exited(body):
	if body.has_method("player"):
		global.transition_scenes = false
		transition_to = null

func change_scene_in_fourth_scene():
	if global.transition_scenes == true:
		if global.current_scene == "fourth_scene":
			if transition_to == "end_one":
				global.finish_changescenes("end_one")
				get_tree().change_scene_to_file("res://scenes/end_one.tscn")
			elif transition_to == "end_two":
				global.finish_changescenes("end_two")
				get_tree().change_scene_to_file("res://scenes/end_two.tscn")
			elif transition_to == "third_scene":
				global.finish_changescenes("third_scene")
				get_tree().change_scene_to_file("res://scenes/third_scene.tscn")
			elif transition_to == "boss_room":
				global.finish_changescenes("boss_room")
				get_tree().change_scene_to_file("res://scenes/boss_room.tscn")
