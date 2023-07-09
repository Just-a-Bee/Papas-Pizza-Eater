extends Control
class_name ShopItem

@export var item_name:String
@export var price:float
@export var description:String
@export var icon:Texture

func _ready():
	#set visual stuff to export var info
	$Contents/Name.text = "[center]" + item_name + "[/center]"
	$Contents/Cost.text = "$" + str(price)
	$Contents/Description.text = description
	$Icon.texture = icon

func get_bought():
	Globals.money -= price
	do_effect()

func _on_button_button_up():
	if Globals.money >= price:
		get_bought()

func do_effect():
	pass
