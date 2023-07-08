extends Node2D

@onready var main = get_parent()


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
