extends Control

@export var level_scene: PackedScene = load("res://scenes/level.tscn")




func _on_single_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level.tscn")


func _on_double_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/level_2.tscn")


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/node_2d.tscn")
