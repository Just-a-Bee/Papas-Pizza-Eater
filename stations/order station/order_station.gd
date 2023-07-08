extends Node2D

@onready var main = get_parent()
@onready var side_bar = get_parent().get_node("SideBar")

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
func take_order():
	#$Camera2D.enabled = true
	var new_order = order.instantiate()
	side_bar.get_node("VBoxContainer").add_child(new_order)
	side_bar.set_disable(true)
	await new_order.contents_displayed
	$Camera2D.enabled = false
	side_bar.set_disable(false)
	main.current_order = new_order
