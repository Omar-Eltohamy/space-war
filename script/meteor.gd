extends Area2D

signal collision
var can_collide = true

var acc := 2
var speed = 100
var rotation_speed: int
var direction_x: float

func _ready() -> void:
	var rng := RandomNumberGenerator.new() 
	
	var path: String = "res://metroers/" + str(rng.randi_range(1, 3)) + ".png"
	$Sprite2D.texture = load(path)
	
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0, width)
	var random_y = rng.randi_range(-150,-50)
	position = Vector2(random_x,random_y)
	
	direction_x = rng.randf_range(-1, 1)
	rotation_speed = rng.randi_range(40, 100)


func _process(delta: float) -> void:
	
	speed += acc * delta
	position += Vector2(direction_x, 1.0) * speed * delta
	rotation_degrees += rotation_speed * delta
	

func _on_body_entered(_body: Node2D) -> void:
	if can_collide:
		collision.emit()
		queue_free()


func _on_area_entered(area: Area2D) -> void:
	area.queue_free()
	$hit_sound.play()
	$Sprite2D.hide()
	can_collide = false
	await get_tree().create_timer(0.9).timeout
	queue_free()
