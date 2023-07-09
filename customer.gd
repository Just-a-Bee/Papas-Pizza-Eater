extends Node2D

func _ready():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", get_parent().COUNTER_POS, randf_range(2.5,3))
	await tween.finished
	$OrderButton.show()


func _on_order_button_button_up():
	get_parent().take_order()
	$OrderButton.hide()

func go_to_pickup():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", get_parent().CUSTOMER_SPAWN_POS, randf_range(2.5,3))
	await tween.finished

	position = get_parent().PICKUP_SPAWN_POS
	var tween_2 = get_tree().create_tween()
	tween_2.tween_property(self, "position", get_parent().PICKUP_COUNTER_POS, randf_range(2.5,3))
