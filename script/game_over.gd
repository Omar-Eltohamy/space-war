extends Control

@export var main_scene: PackedScene = load("res://scenes/Main.tscn")

func _ready() -> void:
	$CanvasLayer/MarginContainer2/Label2.text = $CanvasLayer/MarginContainer2/Label2.text + str(Global.score)
	$lose_sound.play()

func _input(event):
	if event.is_action_pressed("playAgain"):
		get_tree().change_scene_to_packed(main_scene)
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
