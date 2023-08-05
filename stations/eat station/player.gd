extends AnimatedSprite2D
class_name Player

func _process(delta):
	#handle moving
	var moving = false
	if Input.is_action_pressed("up"):
		position += Vector2(0, -Globals.crawl_speed).rotated(rotation)*delta
		moving = true
		speed_scale = 1
		play("Crawl")
	elif Input.is_action_pressed("down") and Globals.can_crawl_backwards:
		position -= Vector2(0, -Globals.crawl_speed).rotated(rotation)*delta
		moving = true
		speed_scale = -1
		play("Crawl")
	else:
		pause()
	
	#handle turning
	var turn_tmp = Globals.turn_speed
	if moving:
		turn_tmp = Globals.slow_turn_speed
	if Input.is_action_pressed("left"):
		rotation -= turn_tmp*delta*Globals.left_turn_multi
	if Input.is_action_pressed("right"):
		rotation += turn_tmp*delta*Globals.right_turn_multi
	
	if position.y < -32:
		position.y = -32
	if position.y > 544:
		position.y = 544
	if position.x < -32:
		position.x = -32
	if position.x > 590:
		position.x = 590
