extends Node2D



func _ready():
	var tween = get_tree().create_tween()
	tween.tween_property(self, "position", get_parent().COUNTER_POS, 3)
	await tween.finished
	$OrderButton.show()


func _on_order_button_button_up():
	get_parent().take_order(self)
