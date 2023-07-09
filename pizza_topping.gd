extends Sprite2D

var type = "none"

func _on_area_2d_area_entered(area):
	if not get_parent().can_eat:
		return
	if area.get_parent() is Player:
		get_eaten()

func get_eaten():
	get_parent().add_topping(type)
	queue_free()
