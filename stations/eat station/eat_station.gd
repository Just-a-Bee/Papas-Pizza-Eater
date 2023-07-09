extends Node2D

@onready var main = get_parent()
@onready var side_bar = get_parent().get_node("SideBar")
var pizza = preload("res://stations/eat station/eat_station_pizza.tscn")


const PIZZA_START = Vector2(-300, 48)
const PIZZA_POSITION = Vector2(88, 48)
const PIZZA_END = Vector2(600, 48)

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

func generate_pizza(order):
	var new_pizza = pizza.instantiate()
	new_pizza.position = PIZZA_START
	
	for topping in order.topping_total_dict.keys():
		for n in order.topping_total_dict[topping]:
			new_pizza.spawn_topping(topping)
	new_pizza.expected_time = order.expected_time
	new_pizza.percent_to_eat = order.percent_to_eat
	new_pizza.topping_to_eat_dict = order.topping_to_eat_dict
	
	add_child(new_pizza)
	var tween = get_tree().create_tween()
	tween.tween_property(new_pizza, "position", PIZZA_POSITION, 1)
	await tween.finished
	new_pizza.can_eat = true

func finish_pizza():
	var current_pizza = $Pizza
	var pizza_grades = current_pizza.grade()
	current_pizza.can_eat = false
	side_bar.set_disable(true)
	var tween = get_tree().create_tween()
	tween.tween_property(current_pizza, "position", PIZZA_END, 1)
	await tween.finished
	remove_child(current_pizza)
	current_pizza.queue_free()
	main.cut_scene.grade_pizza(pizza_grades)
