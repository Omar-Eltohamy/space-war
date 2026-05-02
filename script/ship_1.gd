extends CharacterBody2D


@export var speed : int = 500
var can_shoot: bool = true

signal laser(pos)

func _process(_delta):
	var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	velocity = direction * speed
	move_and_slide()
	if Input.is_action_just_pressed("shoot") and can_shoot:
		$AudioStreamPlayer2D.play()
		laser.emit($laserStartPos.global_position)
		can_shoot = false
		$laserTimer.start()
	
func play_colloision_sound():
	$Damage_sound.play()
	
	
func _on_laser_timer_timeout() -> void:
	can_shoot = true
