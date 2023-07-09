extends ShopItem

func do_effect():
	self.hide()
	Globals.right_turn_multi = 2
	get_parent().get_node("SkateboardLeft").show()
