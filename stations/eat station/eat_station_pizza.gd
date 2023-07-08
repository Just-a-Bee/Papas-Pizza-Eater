extends Sprite2D

@onready var player = get_parent().get_node("Player")
var mask:Image

func _ready():
	mask = Image.create(424, 424, false, Image.FORMAT_RGBA8)
	mask.fill(Color.TRANSPARENT)

func _process(_delta):
	var head_pos = player.position + Vector2(0, -50).rotated(player.rotation)
	var eat_rect = Rect2i(head_pos.x-15 - position.x, head_pos.y-15 - position.y, 30, 30)
	mask.fill_rect(eat_rect, Color.BLACK)
	material.set_shader_parameter("mask", ImageTexture.create_from_image(mask))
	pass

