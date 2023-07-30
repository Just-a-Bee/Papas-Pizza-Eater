extends ShopItem

func do_effect():
	Globals.eat_area += 5
	self.hide()
	if item_name == "Fork":
		get_parent().get_node("Knife").show()
	if item_name == "Knife":
		get_parent().get_node("Spoon").show()
