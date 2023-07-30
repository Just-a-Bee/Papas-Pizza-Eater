extends ShopItem

func do_effect():
	Globals.can_crawl_backwards = true
	self.hide()
