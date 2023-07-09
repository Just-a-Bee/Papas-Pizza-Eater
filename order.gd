extends Control
class_name Card

@onready var main = get_parent().get_parent().get_parent()


var number = 0 #order number
var percent_to_eat = 100 #percent of pizza to eat
var topping_to_eat_dict = {"mushroom" = 4, "pepperoni" = 2, "pepper" = 0}
var topping_total_dict = {"mushroom" = 8, "pepperoni" = 8, "pepper" = 0}
var expected_time = 60

signal contents_displayed

#on ready populate text with variable data
func _ready():
	$Contents/Labels/Number.text += str(number)
	$Contents/Labels/Percent.text += str(percent_to_eat)
	for topping in topping_to_eat_dict.keys():
		var topping_label = Label.new()
		topping_label.text = topping + ": " + str(topping_to_eat_dict[topping])
		topping_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		topping_label.visible = false
		$Contents/Labels.add_child(topping_label)
	display_contents()

func display_contents():
	for item in $Contents/Labels.get_children():
		item.show()
		await get_tree().create_timer(1).timeout
	contents_displayed.emit()


func show_eat():
	$Contents/EatButton.show()
func hide_eat():
	$Contents/EatButton.hide()
func show_finish():
	$Contents/FinishButton.show()
func hide_finish():
	$Contents/FinishButton.hide()

func _on_eat_button_button_up():
	get_parent().get_parent().set_disable(true)
	main.get_node("EatStation").generate_pizza(self)
	$Contents/EatButton.hide()
	show_finish()




func _on_finish_button_button_up():
	main.get_node("EatStation").finish_pizza()
	hide_finish()
	
