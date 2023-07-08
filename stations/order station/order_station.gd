extends Node2D

var customer = preload("res://customer.tscn")
var card = preload("res://card.tscn")

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
	pass
