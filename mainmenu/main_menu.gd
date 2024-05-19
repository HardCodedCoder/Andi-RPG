class_name MainMenu

extends Control


@onready var start_button = $MarginContainer/HBoxContainer/VBoxContainer/StartButton as Button

@onready var exit_button = $MarginContainer/HBoxContainer/VBoxContainer/ExitButton as Button
@onready var start_level = preload("res://scenes/start_scene.tscn") as PackedScene
@onready var title_music = $title_music as AudioStreamPlayer
@onready var start_game = $start_game as AudioStreamPlayer2D

func _ready():
	start_button.button_down.connect(on_start_pressed)
	exit_button.button_down.connect(on_exit_pressed)

	if title_music.stream:
		title_music.stream.loop = true
	title_music.play()

func on_start_pressed() -> void: 
	title_music.stop()
	start_game.play()
	await start_game.finished
	get_tree().change_scene_to_packed(start_level)
	
func on_exit_pressed() -> void: 
	get_tree().quit()
