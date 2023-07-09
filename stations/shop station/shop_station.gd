extends Node2D

func station_opened():
	pass
func station_closed():
	pass

func _ready():
	Globals.money_changed.connect(_on_money_changed)

func _on_money_changed(new_money):
	$CurrentMoney.text = "$" + str(new_money)
