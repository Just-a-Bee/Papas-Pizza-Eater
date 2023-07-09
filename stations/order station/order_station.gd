extends Node2D

@onready var main = get_parent()
@onready var side_bar = get_parent().get_node("SideBar")
var current_customer = null

var customer = preload("res://customer.tscn")
var order = preload("res://order.tscn")


const CUSTOMER_SPAWN_POS = Vector2(700, 220)
const COUNTER_POS = Vector2(160, 220)
const PICKUP_SPAWN_POS = Vector2(720, 180)
const PICKUP_COUNTER_POS = Vector2(180, 180)

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
	new_customer.position = CUSTOMER_SPAWN_POS
	add_child(new_customer)
	current_customer = new_customer

#function to take a customer's order
func take_order():
	main.show_cut_scene()
	var new_order = order.instantiate()
	new_order.position = main.ORDER_POS
	get_parent().add_child(new_order)
	side_bar.set_disable(true)
	await new_order.contents_displayed
	main.hide_cut_scene()
	side_bar.set_disable(false)
	main.current_order = new_order
	current_customer.go_to_pickup()
