extends Sprite2D

@onready var player = get_parent().get_node("Player")
var mask:Image

var topping = preload("res://pizza_topping.tscn")

func _ready():
	mask = Image.create(Globals.pizza_diam, Globals.pizza_diam, false, Image.FORMAT_RGBA8)
	mask.fill(Color.TRANSPARENT)

func _process(_delta):
	var head_pos = player.position + Vector2(0, -50).rotated(player.rotation)
	var eat_rect = Rect2i(head_pos.x-15 - position.x, head_pos.y-15 - position.y, 30, 30)
	mask.fill_rect(eat_rect, Color.BLACK)
	material.set_shader_parameter("mask", ImageTexture.create_from_image(mask))

func spawn_topping(topping_name):
	var new_topping = topping.instantiate()
	new_topping.texture = Globals.topping_sprites_dict[topping_name]
	new_topping.rotation = randf_range(0, 2*PI)
	
	new_topping.position = Vector2(randf_range(0, Globals.pizza_diam * .5), 0)
	new_topping.position = new_topping.position.rotated(randf_range(0, 2*PI))
	new_topping.position += Vector2(Globals.pizza_diam*.5, Globals.pizza_diam*.5)
	new_topping.scale = Vector2(.3, .3)
	
	add_child(new_topping)

