extends Node2D

@onready var main = get_parent()
@onready var order_station = main.get_node("OrderStation")
@onready var side_bar = get_parent().get_node("SideBar")

const MONEY_START_POS = Vector2(446, 250)
const MONEY_END_POS = Vector2(446, 353)

func take_order():
	if order_station.current_customer.customer_type == "grandma":
		$Grandma.show()
	if order_station.current_customer.customer_type == "robot":
		$Robot.show()
func stop_take_order():
	$Grandma.hide()
	$Robot.hide()



func grade_pizza(pizza_grades):
	main.change_station(main.STATIONS.ORDER)
	$PercentScore.text = "% Score: " + str(pizza_grades[0])
	$ToppingScore.text = "Topping Score: " + str(pizza_grades[1])
	$TimeScore.text = "Time Score: " + str(pizza_grades[2])
	var avg_pizza_grade = (pizza_grades[0] + pizza_grades[1] + pizza_grades[2])/3
	var money_earned:int = 20*(pizza_grades[0]/100.0)*(pizza_grades[2]/100.0) + pizza_grades[1]/10
	Globals.money += money_earned
	if order_station.current_customer.customer_type == "grandma":
		$Grandma.show()
	if order_station.current_customer.customer_type == "robot":
		$Robot.show()
	
	main.pause_music()
	self.show()
	
	$Drumroll.play()
	await get_tree().create_timer(1).timeout
	$PercentScore.show()
	
	await get_tree().create_timer(.3).timeout
	$ToppingScore.show()
	
	await get_tree().create_timer(.3).timeout
	$TimeScore.show()
	
	if avg_pizza_grade > 80:
		$GoodGrade.play()
	elif avg_pizza_grade > 60:
		$MedGrade.play()
	else:
		$BadGrade.play()
	
	
	
	await get_tree().create_timer(1).timeout
	$Money.position = MONEY_START_POS
	$Money.show()
	var tween = get_tree().create_tween()
	tween.tween_property($Money, "position", MONEY_END_POS, .3)
	await tween.finished
	$MoneyLabel.text = "$" + str(money_earned) + ".00!!"
	$MoneyLabel.show()
	
	
	await get_tree().create_timer(3).timeout
	self.hide()
	$PercentScore.hide()
	$ToppingScore.hide()
	$TimeScore.hide()
	$Money.hide()
	$Grandma.hide()
	$Robot.hide()
	$MoneyLabel.hide()
	main.remove_child(main.current_order)
	main.current_order.queue_free()
	main.current_order = null
	side_bar.set_disable(false)
	main.get_node("OrderStation").remove_child(main.get_node("OrderStation").current_customer)
	main.get_node("OrderStation").current_customer.queue_free()
	main.play_music()
	main.get_node("OrderStation").spawn_customer()
