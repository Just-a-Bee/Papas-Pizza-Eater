extends Node2D


func _ready():
	$Player.set_process(false)

func station_opened():
	$Player.set_process(true)
func station_closed():
	$Player.set_process(false)
