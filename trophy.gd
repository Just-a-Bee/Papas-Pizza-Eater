extends ShopItem

func do_effect():
	get_node("/root/Main/OrderStation/Trophy").show()
	self.hide()
