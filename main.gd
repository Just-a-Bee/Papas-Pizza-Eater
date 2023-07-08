extends Node2D

enum STATIONS
{
	ORDER = 0,
	EAT = 1,
	SHOP = 2
}

@onready var station_arr = [$OrderStation, $EatStation] #array of all stations, indexes are in enum
@onready var current_station = $OrderStation
var current_order = null

#function to change station, new station is an int from the station enum
func change_station(new_station):
	#close old station
	current_station.hide()
	current_station.station_closed()
	#open new one
	current_station = station_arr[new_station]
	current_station.show()
	current_station.station_opened()
