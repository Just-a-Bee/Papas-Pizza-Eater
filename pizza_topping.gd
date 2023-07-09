extends Sprite2D



func _on_area_2d_area_entered(area):
	if area.get_parent() is Player:
		get_eaten()

func get_eaten():
	queue_free()
