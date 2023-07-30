extends ShopItem

func do_effect():
	Globals.crawl_speed += 30
	self.hide()
