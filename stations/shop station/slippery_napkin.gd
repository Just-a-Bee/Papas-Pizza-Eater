@tool
extends ShopItem

func do_effect():
	Globals.speed_level += 1
	if name == "SlipperyNapkin":
		get_parent().get_node("SlipperierNapkin").show()
	if name == "SlipperierNapkin":
		get_parent().get_node("SlipperiestNapkin").show()
