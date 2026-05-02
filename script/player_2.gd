extends CharacterBody2D


@export var speed : int = 500
var can_shoot2: bool = true

signal laser(pos)

func _process(_delta):
	var direction = Input.get_vector("left2","right2","up2","down2")
	velocity = direction * speed
	move_and_slide()
	if Input.is_action_just_pressed("shoot2") and can_shoot2:
		$AudioStreamPlayer2D.play()
		laser.emit($laserStartPos.global_position)
		can_shoot2 = false
		$laserTimer2.start()
	
func play_colloision_sound():
	$Damage_sound.play()
	

func _on_laser_timer_2_timeout() -> void:
	can_shoot2 = true
