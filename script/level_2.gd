extends Node2D

var meteor_scene: PackedScene = load("res://scenes/meteor_1.tscn")
var laser_scene: PackedScene = load("res://scenes/laser.tscn")

var health := 10
var acc := 0

func _ready():
	
	get_tree().call_group("ui", "set_health", health)
	
	var size := get_viewport().get_visible_rect().size
	var rng := RandomNumberGenerator.new()
	#star part-----------------
	for star in $stars.get_children():
		
		var random_x = rng.randi_range(0, int(size.x))
		var random_y = rng.randi_range(0, int(size.y))
		star.position = Vector2(random_x, random_y)
		
		var random_scale = rng.randf_range(1,2)
		star.scale = Vector2(random_scale,random_scale)
		
		star.speed_scale = rng.randf_range(0.6, 1.4)
#---------------------------------

func _on_meteor_timer_timeout():
	acc += 1
	var meteor = meteor_scene.instantiate()
	meteor.acc = acc
	add_child(meteor)
	
	meteor.connect("collision", _on_meteor_collision)

func _on_meteor_collision():
	health -= 1
	get_tree().call_group("ui", "set_health", health)
	$ship1.play_colloision_sound()
	$player2.play_colloision_sound()
	if health <= 0:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
	
func _on_ship_1_laser(pos) -> void:
	var laser = laser_scene.instantiate()
	add_child(laser)
	laser.position = pos

func _on_player_2_laser(pos: Variant) -> void:
	var laser = laser_scene.instantiate()
	add_child(laser)
	laser.position = pos

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
