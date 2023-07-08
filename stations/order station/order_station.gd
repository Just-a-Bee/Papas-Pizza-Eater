extends Node2D

@onready var main = get_parent()

var customer = preload("res://customer.tscn")
var order = preload("res://order.tscn")

const DOOR_POS = Vector2(960, 448)
const COUNTER_POS = Vector2(384, 448)

func _ready():
	spawn_customer()

#functions called when station is opened or closed
func station_opened():
	pass
func station_closed():
	pass


#function to spawn a new customer at the door
func spawn_customer():
	var new_customer = customer.instantiate()
	new_customer.position = DOOR_POS
	add_child(new_customer)

#function to take a customer's order
func take_order(orderer):
	#$Camera2D.enabled = true
	#var new_order = order.instatiate()
	#main.populate_order(new_order)
	pass
