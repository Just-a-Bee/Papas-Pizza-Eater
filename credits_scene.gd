extends Node2D



func _on_to_menu_button_up():
	get_parent().get_node("Sprite2D").show()
	hide()
