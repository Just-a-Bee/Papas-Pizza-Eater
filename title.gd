extends Control

func _on_play_button_up():
	get_tree().change_scene_to_file("res://main.tscn")

func _on_credits_button_up():
	$credits_scene.show()
	$Sprite2D.hide()


func _on_minigame_button_up():
	get_tree().change_scene_to_file("res://pizza consumable minigame/pizza_consumeable_minigame.tscn")
