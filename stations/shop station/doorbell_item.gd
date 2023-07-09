extends ShopItem

func do_effect():
	get_node("/root/Main/OrderStation").play_doorbell = true
	self.hide()
