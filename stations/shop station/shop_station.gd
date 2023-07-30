extends Node2D

func station_opened():
	pass
func station_closed():
	pass

func _ready():
	Globals.money_changed.connect(_on_money_changed)
	

func _on_money_changed(new_money):
	var moneyStr = str(new_money)
	if moneyStr.length() == 1:
		moneyStr = "00" + moneyStr
	elif moneyStr.length() == 2:
		moneyStr = "0" + moneyStr
	$CurrentMoney.text = "$" + moneyStr
