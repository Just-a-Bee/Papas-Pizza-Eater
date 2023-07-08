extends Control
class_name ShopItem

@export var item_name:String
@export var price:float
@export var description:String
@export var icon:ImageTexture

func _ready():
	#set visual stuff to export var info
	$Contents/Name.text = name
	$Contents/Cost.text = "$" + str(price)
	$Contents/Description.text = description
	$Icon.texture = icon

func get_bought():
	pass
