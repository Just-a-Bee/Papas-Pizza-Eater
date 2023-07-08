extends Sprite2D

@onready var player = get_parent().get_node("Player")
var mask:Image

func _ready():
	mask = Image.create(512, 512, false, Image.FORMAT_RGBA8)
	mask.fill(Color.TRANSPARENT)


func _process(_delta):
	mask.fill_rect(Rect2i(player.position.x-30, player.position.y-30, 60, 60), Color.BLACK)
	material.set_shader_parameter("mask", ImageTexture.create_from_image(mask))
	
