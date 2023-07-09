extends Node

var topping_sprites_dict = {
	"mushroom" = preload("res://assets/mushroom.png"),
	"pepperoni" = preload("res://assets/pepperoni.png"),
	"pepper" = preload("res://assets/bell pepper.png")
}

var pizza_diam = 424

var money:float = 0

#player stats
var crawl_speed = 100
var turn_speed = PI/2
var slow_turn_speed = PI/8
var eat_area = 20
var right_turn_multi = 1
var left_turn_multi = 1

