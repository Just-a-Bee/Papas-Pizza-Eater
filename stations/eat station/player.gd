extends AnimatedSprite2D
class_name Player

var speed = 100
var acceleration = 50
var direction = 0
var turn_speed = PI/2
var slow_turn_speed = PI/8

func _process(delta):
	#handle moving
	var moving = false
	if Input.is_action_pressed("up"):
		position += Vector2(0, -speed).rotated(rotation)*delta
		moving = true
		play("Crawl")
	else:
		pause()
	
	#handle turning
	var turn_tmp = turn_speed
	if moving:
		turn_tmp = slow_turn_speed
	if Input.is_action_pressed("left"):
		rotation -= turn_tmp*delta
	if Input.is_action_pressed("right"):
		rotation += turn_tmp*delta
