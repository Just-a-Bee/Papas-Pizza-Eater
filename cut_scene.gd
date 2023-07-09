extends Node2D

@onready var main = get_parent()
@onready var side_bar = get_parent().get_node("SideBar")

func grade_pizza(pizza_grades):
	main.current_order.queue_free()
	main.current_order = null
	self.show()
	$PercentScore.text = "% Score: " + str(pizza_grades[0])
	$PercentScore.show()
	$ToppingScore.text = "Topping Score: " + str(pizza_grades[1])
	$ToppingScore.show()
	$TimeScore.text = "Time Score: " + str(pizza_grades[2])
	$TimeScore.show()
	var avg_pizza_grade = (pizza_grades[0] + pizza_grades[1] + pizza_grades[2])/3
	Globals.money += 35 * avg_pizza_grade / 100
	print(Globals.money)
	
	await get_tree().create_timer(3).timeout
	self.hide()
	$PercentScore.hide()
	$ToppingScore.hide()
	$TimeScore.hide()
	side_bar.set_disable(false)
	main.change_station(main.STATIONS.ORDER)
