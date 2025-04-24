@tool
extends ShopItem

func do_effect():
	Globals.turn_level += 1
	get_parent().get_node("SkateboardLeft").show()
