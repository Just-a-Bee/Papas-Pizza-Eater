extends Sprite2D

var closemouthimag = ImageTexture.create_from_image(Image.load_from_file("res://pizza consumable minigame/assets/custome-bite.png"))
var openmouthima = ImageTexture.create_from_image(Image.load_from_file("res://pizza consumable minigame/assets/custome.png"))


#position of the mouth on the customer sprite
var mouthOffset = Vector2(20,60)

@onready var pizza = get_parent().get_node("slice")


func _ready():
	pass # Replace with function body.


func _process(delta):
	pass


func _input(event):
	if event is InputEventMouseButton:
		setMouth(not event.pressed)
		if event.pressed:
			pizza.eat((self.position+mouthOffset))
	if event is InputEventMouseMotion:
		position = event.position



func setMouth(mouthstate):
	if mouthstate:
		texture = openmouthima
	else:
		texture = closemouthimag
