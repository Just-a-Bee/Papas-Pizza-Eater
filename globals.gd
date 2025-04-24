extends Node

signal stats_updated

var topping_sprites_dict = {
	"mushroom" = preload("res://assets/pizza assets/mushroom.png"),
	"pepperoni" = preload("res://assets/pizza assets/pepperoni.png"),
	"pepper" = preload("res://assets/pizza assets/bell pepper.png")
}

var pizza_diam = 424

var money:float = 0 : set = set_money
signal money_changed

#player stats


var speed_level = 0:
	set(value):
		speed_level = value
		stats_updated.emit()
var turn_level = 0:
	set(value):
		turn_level = value
		stats_updated.emit()
var eat_level = 0:
	set(value):
		eat_level = value
		stats_updated.emit()
var back_level = 0:
	set(value):
		back_level = value
		stats_updated.emit()


func set_money(new_money):
	money = new_money
	money_changed.emit(money)
	
