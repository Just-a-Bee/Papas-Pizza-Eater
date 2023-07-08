extends Sprite2D

const PIZZA_FINISHED_THRESH = .98

const res = 512
const pizza_finished_pixels = res*res*PIZZA_FINISHED_THRESH

var tmpImageTex = ImageTexture.new()
var biteMask = Image.load_from_file("res://pizza consumable minigame/assets/bite.png")
var mask = Image.load_from_file("res://pizza consumable minigame/assets/slice-alpha.png")


# Called when the node enters the scene tree for the first time.
func _ready():
	#mask needs to be the same format as slice.png, but it doesn't have an alpha channel yet
	mask.convert(Image.FORMAT_RGBA8) 
	updateMask()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func eat(bitePosition):
	
	#convert to local coords
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
	var pixelCount:int = res*res
	for pixel in (res*res):
		if mask.get_pixel(pixel%res, pixel/res).r:
			pixelCount -= 1
			if pixelCount <= pizza_finished_pixels:
				return false
	
	return true #still need to come up with an implementation for this
