extends Sprite2D

#const PIZZA_FINISHED_THRESH = .02

const res = 512

var tmpImageTex = ImageTexture.new()
var biteMask = Image.load_from_file("res://pizza consumable minigame/assets/bite.png")
var mask = Image.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	mask = Image.create(res,res,false,Image.FORMAT_RGBA8)
	mask.fill(Color(1,1,1,1))
	updateMask()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func eat(bitePosition):
	
	#make local coords
	bitePosition -= self.position #idk why this is the offset but it works
	print(bitePosition)
	
	#
	mask.blend_rect(biteMask, Rect2i(0,0,512,512),bitePosition)
	updateMask()
	if checkComplete():
		print("well it looks like you finished the pizza")
	
func updateMask():
	
	tmpImageTex = ImageTexture.create_from_image(mask)
	material.set_shader_parameter("mask", tmpImageTex)

func checkComplete() -> bool:
	return false #still need to come up with an implementation for this
