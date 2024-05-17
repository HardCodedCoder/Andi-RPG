extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	if global.game_first_load == true:
		$player.position.x = global.player_start_posx
		$player.position.y = global.player_start_posy
	else:
		$player.position.x = global.player_exit_second_scene_posx
		$player.position.y = global.player_exit_second_scene_posy


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	change_scene()


func _on_transition_to_second_scene_body_entered(body):
	if body.has_method("player"):
		global.transition_scenes = true


func _on_transition_to_second_scene_body_exited(body):
	if body.has_method("player"):
		global.transition_scenes = false


func change_scene():
	if global.transition_scenes == true:
		if global.current_scene == "world":
			get_tree().change_scene_to_file("res://scenes/secondscene.tscn")
			global.game_first_load = false
			global.finish_changescenes("secondscene")
