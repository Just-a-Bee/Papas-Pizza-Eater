extends Control
class_name Card


var number = 0 #order number
var percent_to_eat = 100 #percent of pizza to eat
var topping_to_eat_dict = {"Mushrooms" = 4, "Pepperoni" = 2}
var topping_total_dict = {"Mushrooms" = 8, "Pepperoni" = 8}
var expected_time = 60

#on ready populate text with variable data
func _ready():
	$Contents/OrderNumber.text += str(number)
	$Contents/Percent.text += str(percent_to_eat)
	for topping in topping_to_eat_dict.keys():
		var topping_label = Label.new()
		topping_label.text = topping + ": " + str(topping_to_eat_dict[topping])
		topping_label.theme = load("res://black.tres")
		topping_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		$Contents.add_child(topping_label)
