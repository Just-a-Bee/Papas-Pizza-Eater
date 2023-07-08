extends Control

@onready var main = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _on_order_button_up():
	main.change_station(main.STATIONS.ORDER)
func _on_eat_button_up():
	main.change_station(main.STATIONS.EAT)
func _on_return_button_up():
	main.change_station(main.STATIONS.RETURN)
func _on_shop_button_up():
	main.change_station(main.STATIONS.SHOP)


