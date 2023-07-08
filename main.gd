extends Node2D

enum STATIONS
{
	ORDER = 0,
	EAT = 1,
	RETURN = 2,
	SHOP = 3
}

@onready var stationArr = [$OrderStation, $EatStation]
@onready var currentStation = $OrderStation

func change_station(newStation):
	currentStation.hide()
	currentStation.station_closed()
	currentStation = stationArr[newStation]
	currentStation.show()
	currentStation.station_opened()
