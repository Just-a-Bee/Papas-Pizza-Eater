extends Control

@onready var main = get_parent()

#function to disable or enable the buttons
func set_disable(disable):
	$VBoxContainer/HBoxContainer/Order.disabled = disable
	$VBoxContainer/HBoxContainer/Eat.disabled = disable
	$VBoxContainer/HBoxContainer/Shop.disabled = disable

#when the buttons are pressed, change main to respective station 
func _on_order_button_up():
	main.change_station(main.STATIONS.ORDER)
func _on_eat_button_up():
	main.change_station(main.STATIONS.EAT)
func _on_shop_button_up():
	main.change_station(main.STATIONS.SHOP)


