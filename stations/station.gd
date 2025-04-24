extends Node2D
class_name Station

signal opened
signal closed 

func station_opened():
	opened.emit()

func station_closed():
	closed.emit()
