extends CharacterBody2D

@onready var game_over = preload("res://gameover/game_over.tscn") as PackedScene
@onready var powerup_timer = $powerup_timer 

var enemy_inattack_range = false
var enemy_attack_cooldown = true
var health = 100
var player_alive = true
var attack_ip = false
var is_pumped = false 

const SPEED = 100
var current_dir = "none"

func _ready():
	$AnimatedSprite2D.play("front_idle")

func _physics_process(delta):
	player_movement(delta)
	enemy_attack()
	attack()
	current_camera()
	update_health()

	if health <= 0:
		player_alive = false
		health = 0
		print ("player has been killed")
		self.queue_free()
		get_tree().change_scene_to_packed(game_over)

func player_movement(delta):
	if Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = SPEED
		velocity.y = 0
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -SPEED
		velocity.y = 0
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.y = SPEED
		velocity.x = 0
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.y = -SPEED
		velocity.x = 0
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0

	move_and_slide()

func play_anim(movement):
	var dir = current_dir    
	var anim = $AnimatedSprite2D

	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			if attack_ip == false:
				anim.play("side_idle")
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("side_walk")
		elif movement == 0:
			if attack_ip == false:
				anim.play("side_idle")
	if dir == "down":
		anim.flip_h = true
		if movement == 1:
			anim.play("front_walk")
		elif movement == 0:
			if attack_ip == false:
				anim.play("front_idle")
	if dir == "up":
		anim.flip_h = true
		if movement == 1:
			anim.play("back_walk")
		elif movement == 0:
			if attack_ip == false:
				anim.play("back_idle")

func player():
	pass

func _on_player_hitbox_body_entered(body):
	if body.has_method("enemy"):
		enemy_inattack_range = true

func _on_player_hitbox_body_exited(body):
	if body.has_method("enemy"):
		enemy_inattack_range = false

func enemy_attack():
	if enemy_inattack_range and enemy_attack_cooldown == true:
		if is_pumped == true:
			health = health - 5
		else:
			health = health - 40
		$player_hurt.play()
		enemy_attack_cooldown = false
		$attack_cooldown.start()
		print(health)

func _on_attack_cooldown_timeout():
	enemy_attack_cooldown = true

func attack():
	var dir = current_dir

	if Input.is_action_just_pressed("attack"):
		global.player_current_attack = true
		attack_ip = true
		if dir == "right":
			$AnimatedSprite2D.flip_h = false
			$AnimatedSprite2D.play("side_attack")
			$weapon_sound.play()
			$deal_attack_timer.start()
		if dir == "left":
			$AnimatedSprite2D.flip_h = true
			$AnimatedSprite2D.play("side_attack")
			$weapon_sound.play()
			$deal_attack_timer.start()
		if dir == "down":
			$AnimatedSprite2D.play("front_attack")
			$weapon_sound.play()
			$deal_attack_timer.start()
		if dir == "up":
			$AnimatedSprite2D.play("back_attack")
			$weapon_sound.play()
			$deal_attack_timer.start()

func _on_deal_attack_timer_timeout():
	$deal_attack_timer.stop()
	global.player_current_attack = false
	attack_ip = false

func current_camera():
	if global.current_scene == "startscene":
		$Startscene_camera.enabled = true
		$secondscene_camera.enabled = false
		$third_scene_camera.enabled = false
		$scene_with_key_camera.enabled = false
		$fourth_scene_camera.enabled = false
		$end_one_camera.enabled = false
		$end_two_camera.enabled = false
		$bossroom_camera.enabled = false
	elif global.current_scene == "second_scene":
		$Startscene_camera.enabled = false
		$secondscene_camera.enabled = true
		$third_scene_camera.enabled = false
		$scene_with_key_camera.enabled = false
		$fourth_scene_camera.enabled = false
		$end_one_camera.enabled = false
		$end_two_camera.enabled = false
		$bossroom_camera.enabled = false
	elif global.current_scene == "third_scene":
		$Startscene_camera.enabled = false
		$secondscene_camera.enabled = false
		$third_scene_camera.enabled = true
		$scene_with_key_camera.enabled = false
		$fourth_scene_camera.enabled = false
		$end_one_camera.enabled = false
		$end_two_camera.enabled = false
		$bossroom_camera.enabled = false
	elif global.current_scene == "scene_with_key":
		$Startscene_camera.enabled = false
		$secondscene_camera.enabled = false
		$third_scene_camera.enabled = false
		$scene_with_key_camera.enabled = true
		$fourth_scene_camera.enabled = false
		$end_one_camera.enabled = false
		$end_two_camera.enabled = false
		$bossroom_camera.enabled = false
	elif global.current_scene == "fourth_scene":
		$Startscene_camera.enabled = false
		$secondscene_camera.enabled = false
		$third_scene_camera.enabled = false
		$scene_with_key_camera.enabled = false
		$fourth_scene_camera.enabled = true
		$end_one_camera.enabled = false
		$end_two_camera.enabled = false
		$bossroom_camera.enabled = false
	elif global.current_scene == "end_one":
		$Startscene_camera.enabled = false
		$secondscene_camera.enabled = false
		$third_scene_camera.enabled = false
		$scene_with_key_camera.enabled = false
		$fourth_scene_camera.enabled = false
		$end_one_camera.enabled = true
		$end_two_camera.enabled = false
		$bossroom_camera.enabled = false
	elif global.current_scene == "end_two":
		$Startscene_camera.enabled = false
		$secondscene_camera.enabled = false
		$third_scene_camera.enabled = false
		$scene_with_key_camera.enabled = false
		$fourth_scene_camera.enabled = false
		$end_one_camera.enabled = false
		$end_two_camera.enabled = true
		$bossroom_camera.enabled = false
	elif global.current_scene == "boss_room":
		$Startscene_camera.enabled = false
		$secondscene_camera.enabled = false
		$third_scene_camera.enabled = false
		$scene_with_key_camera.enabled = false
		$fourth_scene_camera.enabled = false
		$end_one_camera.enabled = false
		$end_two_camera.enabled = false
		$bossroom_camera.enabled = true

func update_health():
	var healthbar = $healthbar
	healthbar.value = health

	if health >= 100:
		healthbar.visible = false
	else:
		healthbar.visible = true

func _on_regin_timer_timeout():
	if health < 100:
		health = health + 10
		if health > 100:
			health = 100
	if health <= 0:
		health = 0

func become_pumped():
	is_pumped = true
	self.scale = Vector2(1.4, 1.4)
	powerup_timer.start(10)

func _on_powerup_timeout():
	is_pumped = false
	self.scale = Vector2(1, 1)
