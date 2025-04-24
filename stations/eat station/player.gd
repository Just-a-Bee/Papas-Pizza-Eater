extends AnimatedSprite2D
class_name Player

var crawl_speed = 100
var turn_speed = PI/2
var slow_turn_speed = PI/8
var eat_area = 20
var right_turn_multi = 1
var left_turn_multi = 1
var can_crawl_backwards = false

func _ready():
	Globals.stats_updated.connect(_on_stats_updated)

func _on_stats_updated():
	update_stats()

func _process(delta):
	#handle moving
	var moving = false
	if Input.is_action_pressed("up"):
		position += Vector2(0, -crawl_speed).rotated(rotation)*delta
		moving = true
		$AnimationPlayer.speed_scale = 1 + Globals.speed_level/2
		$AnimationPlayer.play("crawl")
	elif Input.is_action_pressed("down") and can_crawl_backwards:
		position -= Vector2(0, -crawl_speed).rotated(rotation)*delta
		moving = true
		$AnimationPlayer.speed_scale = -(1 + Globals.speed_level/2)
		$AnimationPlayer.play("crawl")
	else:
		$AnimationPlayer.pause()
	
	#handle turning
	var turn_amount = turn_speed
	if moving:
		turn_amount = slow_turn_speed
	
	var turn_dir = 0
	if Input.is_action_pressed("left"):
		turn_dir -= 1
		turn_amount = turn_amount * left_turn_multi
	if Input.is_action_pressed("right"):
		turn_dir += 1
		turn_amount = turn_amount * right_turn_multi
	
	if Globals.turn_level > 0 and turn_dir > 0:
		$Boardparent.show()
		$Boardparent.scale = Vector2(1,1)
		
	elif Globals.turn_level > 1 and turn_dir < 0:
		$Boardparent.show()
		$Boardparent.scale = Vector2(-1,1)
	else:
		$Boardparent.hide()
	
	rotation += turn_amount*delta*turn_dir
	# stay on screen
	position.x = clamp(position.x, -32, 590)
	position.y = clamp(position.y, -32, 544)



func update_stats():
	crawl_speed = 100 + 30*Globals.speed_level
	
	if Globals.turn_level > 0:
		right_turn_multi = 2
	if Globals.turn_level > 1:
		left_turn_multi = 2
	
	eat_area = 20 + 5*Globals.eat_level
	if Globals.eat_level == 1:
		$Fork.show()
	if Globals.eat_level == 2:
		$Knife.show()
	if Globals.eat_level == 3:
		$Fork/Spoon.show()
		$Knife.hide()
		$Fork.self_modulate = Color(00, 00, 00, 00)
	
	if Globals.back_level > 0:
		can_crawl_backwards = true
		animation = "Pizza_Crawl"
	
