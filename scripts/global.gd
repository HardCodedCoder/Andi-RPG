extends Node

var player_current_attack = false

var current_scene = "start_scene"
var last_scene = null
var transition_scenes = false

var player_exit_second_scene_posx = 243
var player_exit_second_scene_posy = 139

var player_exit_third_scene_posx = 594
var player_exit_third_scene_posy = 92

var player_exit_fourth_scene_posx = 367
var player_exit_fourth_scene_posy = 18

var player_exit_scene_with_key_posx = 327
var player_exit_scene_with_key_posy = 267

var player_exit_end_one_posx = 16
var player_exit_end_one_posy = 287

var player_exit_end_two_posx = 491
var player_exit_end_two_posy = 18

var player_exit_boss_room_posx = 187
var player_exit_boss_room_posy = 208

var player_start_posx = 129
var player_start_posy = 108

var game_first_load = true

func finish_changescenes(transitioned_to):
	if transition_scenes == true:
		transition_scenes = false
		last_scene = current_scene
		current_scene = transitioned_to
