extends Node2D

@onready var main = get_parent()
@onready var side_bar = get_parent().get_node("SideBar")
var pizza = preload("res://stations/eat station/eat_station_pizza.tscn")


const PIZZA_START = Vector2(-300, 160)
const PIZZA_POSITION = Vector2(300, 160)
const PIZZA_END = Vector2(600, 160)

func _ready():
	$Player.set_process(false)

func station_opened():
	$Player.set_process(true)
	if main.current_order:
		main.current_order.show_eat()

func station_closed():
	$Player.set_process(false)
	if main.current_order:
		main.current_order.hide_eat()

func generate_pizza(topping_total_dict):
	var new_pizza = pizza.instantiate()
	new_pizza.position = PIZZA_START
	#give it toppings
	add_child(new_pizza)
	var tween = get_tree().create_tween()
	tween.tween_property(new_pizza, "position", PIZZA_POSITION, 1)

func finish_pizza():
	side_bar.set_disable(true)
	var tween = get_tree().create_tween()
	tween.tween_property($Pizza, "position", PIZZA_POSITION, 1)
	await tween.finished
	main.change_station(main.STATIONS.RETURN)
	remove_child($Pizza)
	#give the return station!!
