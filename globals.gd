extends Node

var topping_sprites_dict = {
	"mushroom" = preload("res://assets/pizza assets/mushroom.png"),
	"pepperoni" = preload("res://assets/pizza assets/pepperoni.png"),
	"pepper" = preload("res://assets/pizza assets/bell pepper.png")
}

var pizza_diam = 424

var money:float = 0 : set = set_money
signal money_changed

#player stats
var crawl_speed = 100
var turn_speed = PI/2
var slow_turn_speed = PI/8
var eat_area = 20
var right_turn_multi = 1
var left_turn_multi = 1
var can_crawl_backwards = false

func set_money(new_money):
	money = new_money
	money_changed.emit(money)
	
