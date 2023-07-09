extends Node2D

@onready var main = get_parent()
@onready var side_bar = get_parent().get_node("SideBar")

const MONEY_START_POS = Vector2(446, 250)
const MONEY_END_POS = Vector2(446, 353)

func grade_pizza(pizza_grades):
	main.change_station(main.STATIONS.ORDER)
	$PercentScore.text = "% Score: " + str(pizza_grades[0])
	$ToppingScore.text = "Topping Score: " + str(pizza_grades[1])
	$TimeScore.text = "Time Score: " + str(pizza_grades[2])
	var avg_pizza_grade = (pizza_grades[0] + pizza_grades[1] + pizza_grades[2])/3
	Globals.money += 35 * avg_pizza_grade / 100
	
	
	self.show()
	
	await get_tree().create_timer(1).timeout
	$PercentScore.show()
	
	await get_tree().create_timer(.3).timeout
	$ToppingScore.show()
	
	await get_tree().create_timer(.3).timeout
	$TimeScore.show()
	
	await get_tree().create_timer(1).timeout
	$Money.show()
	
	await get_tree().create_timer(3).timeout
	self.hide()
	$PercentScore.hide()
	$ToppingScore.hide()
	$TimeScore.hide()
	$Money.hide()
	main.remove_child(main.current_order)
	main.current_order.queue_free()
	main.current_order = null
	side_bar.set_disable(false)
	main.get_node("OrderStation").remove_child(main.get_node("OrderStation").current_customer)
	main.get_node("OrderStation").current_customer.queue_free()
	
	main.get_node("OrderStation").spawn_customer()
