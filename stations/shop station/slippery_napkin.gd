extends ShopItem

func do_effect():
	Globals.crawl_speed += 30
	self.hide()
	if name == "SlipperyNapkin":
		get_parent().get_node("SlipperierNapkin").show()
	if name == "SlipperierNapkin":
		get_parent().get_node("SlipperiestNapkin").show()
