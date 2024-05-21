class_name GameOver

extends Control


@onready var again_button = $MarginContainer/HBoxContainer/VBoxContainer/AgainButton as Button
@onready var back_button = $MarginContainer/HBoxContainer/VBoxContainer/BackButton as Button

@onready var restart_level = load("res://scenes/start_scene.tscn") as PackedScene
@onready var return_to_menu = load("res://mainmenu/main_menu.tscn") as PackedScene

func _ready():
	again_button.button_down.connect(on_restart_pressed)
	back_button.button_down.connect(on_returnmenu_pressed)


func on_restart_pressed() -> void: 
	get_tree().change_scene_to_packed(restart_level)
	
func on_returnmenu_pressed() -> void: 
	get_tree().change_scene_to_packed(return_to_menu)
