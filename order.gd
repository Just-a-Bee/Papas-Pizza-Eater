extends Control
class_name Card

@onready var main = get_parent()


var number = 0 #order number
var percent_to_eat = randi_range(2, 8)*10 #percent of pizza to eat
var topping_total_dict = {"mushroom" = 6, "pepperoni" = 4, "pepper" = 2}
var topping_to_eat_dict = {"mushroom" = 4, "pepperoni" = 2, "pepper" = 0}

var expected_time = percent_to_eat / 2

signal contents_displayed

#on ready populate text with variable data
func _ready():
	for topping in topping_to_eat_dict.keys():
		topping_to_eat_dict[topping] = randi_range(0, topping_total_dict[topping])
	
	var numStr = str(number)
	if number < 10:
		numStr = "00" + numStr
	elif number < 100:
		numStr = "0" + numStr
	$Contents/Labels/Number.text = numStr
	$Contents/Labels/Percent.text = "Eat " + str(percent_to_eat) + "%"
	$Contents/Labels/Pepperoni/PepperoniLabel.text = "X " + str(topping_to_eat_dict["pepperoni"])
	$Contents/Labels/Mushroom/MushroomLabel.text = "X " + str(topping_to_eat_dict["mushroom"])
	$Contents/Labels/Pepper/PepperLabel.text = "X " + str(topping_to_eat_dict["pepper"])
	display_contents()

func display_contents():
	for item in $Contents/Labels.get_children():
		item.show()
		await get_tree().create_timer(1).timeout
	contents_displayed.emit()


func show_eat():
	$EatButton.show()
func hide_eat():
	$EatButton.hide()
func show_finish():
	$FinishButton.show()
func hide_finish():
	$FinishButton.hide()

func _on_eat_button_button_up():
	get_parent().side_bar.set_disable(true)
	main.get_node("EatStation").generate_pizza(self)
	hide_eat()
	await get_tree().create_timer(5).timeout
	show_finish()




func _on_finish_button_button_up():
	main.get_node("EatStation").finish_pizza()
	hide_finish()
	
