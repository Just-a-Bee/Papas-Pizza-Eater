extends AnimatedSprite2D
class_name Player

func _process(delta):
	#handle moving
	var moving = false
	if Input.is_action_pressed("up"):
		position += Vector2(0, -Globals.crawl_speed).rotated(rotation)*delta
		moving = true
		play("Crawl")
	else:
		pause()
	
	#handle turning
	var turn_tmp = Globals.turn_speed
	if moving:
		turn_tmp = Globals.slow_turn_speed
	if Input.is_action_pressed("left"):
		rotation -= turn_tmp*delta
	if Input.is_action_pressed("right"):
		rotation += turn_tmp*delta
