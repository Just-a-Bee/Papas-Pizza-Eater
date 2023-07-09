extends Sprite2D

@onready var player = get_parent().get_node("Player")
var mask:Image
var can_eat = false

var percent_to_eat

var topping_to_eat_dict
var toppings_eaten_dict = {"mushroom" = 0, "pepperoni" = 0, "pepper" = 0}

var expected_time
var time_eaten = 0

var topping = preload("res://pizza_topping.tscn")

func _ready():
	mask = Image.create(Globals.pizza_diam, Globals.pizza_diam, false, Image.FORMAT_RGBA8)
	mask.fill(Color.TRANSPARENT)
#adds time to the time its taken to eat pizza, and eats pizza arond the player's head
func _process(delta):
	if can_eat:
		time_eaten += delta
		var head_pos = player.position + Vector2(0, -50).rotated(player.rotation)
		var eat_rect = Rect2i(head_pos.x-15 - position.x, head_pos.y-15 - position.y, 30, 30)
		mask.fill_rect(eat_rect, Color.BLACK)
		material.set_shader_parameter("mask", ImageTexture.create_from_image(mask))
#function to spawn a topping at a random positoin
func spawn_topping(topping_name):
	var new_topping = topping.instantiate()
	new_topping.type = topping_name
	new_topping.texture = Globals.topping_sprites_dict[topping_name]
	new_topping.rotation = randf_range(0, 2*PI)
	
	new_topping.position = Vector2(randf_range(0, Globals.pizza_diam * .5), 0)
	new_topping.position = new_topping.position.rotated(randf_range(0, 2*PI))
	new_topping.position += Vector2(Globals.pizza_diam*.5, Globals.pizza_diam*.5)
	new_topping.scale = Vector2(.3, .3)
	
	add_child(new_topping)
#function to add an eaten topping to eaten toppings
func add_topping(topping_name):
	if toppings_eaten_dict.has(topping_name):
		toppings_eaten_dict[topping_name] += 1
	else:
		toppings_eaten_dict[topping_name] = 1

#function to grade the pizza based on desired state returns an array of three grades
func grade():
	var percent_grade = 100
	
	#calc toppings grade
	var toppings_grade = 100
	var toppings_off = 0
	for topping in topping_to_eat_dict.keys():
		toppings_off += abs(topping_to_eat_dict[topping] - toppings_eaten_dict[topping])
	toppings_grade -= toppings_off * 10
	
	#calc time grade
	var time_grade = 100
	var time_off = time_eaten - expected_time
	if time_off > 0:
		time_grade -= time_off
	
	return [percent_grade, toppings_grade, time_grade]
