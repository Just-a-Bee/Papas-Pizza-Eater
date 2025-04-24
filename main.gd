extends Node2D

enum STATIONS
{
	ORDER = 0,
	EAT = 1,
	SHOP = 2
}

signal done_prompt_shown

@onready var tutorial_button = $Tutorial/TutorialBubble/MarginContainer/VBoxContainer/Button
@onready var tutorial_animation = $Tutorial/AnimationPlayer
@onready var cut_scene = $CutScene
@onready var side_bar = $SideBar
@onready var station_arr = [$OrderStation, $EatStation, $ShopStation] #array of all stations, indexes are in enum
@onready var current_station = $OrderStation
var current_order = null
var is_in_tutorial = true

const ORDER_POS = Vector2(568, 104)


func _ready():
	do_tutorial()
	#station_arr[STATIONS.ORDER].spawn_customer()

# function to do the tutorial
func do_tutorial():
	# order tutorial
	side_bar.set_disable(true)
	tutorial_animation.play("welcome")
	await tutorial_button.button_up
	tutorial_animation.play("take_order")
	station_arr[STATIONS.ORDER].spawn_customer()
	await station_arr[STATIONS.ORDER].order_started
	$Tutorial.hide()
	await station_arr[STATIONS.ORDER].order_taken
	$Tutorial.show()
	
	# open eat station
	tutorial_animation.play("go_eat")
	side_bar.set_disable(false)
	await station_arr[STATIONS.EAT].opened
	
	# press "start eating"
	tutorial_animation.play("press_eat")
	side_bar.set_disable(true)
	await station_arr[STATIONS.EAT].eat_started
	
	# explain controls
	tutorial_animation.play("start_eat")
	await tutorial_button.button_up
	$Tutorial.hide()
	# eat for a bit
	await get_tree().create_timer(10).timeout
	# press "done eating"
	$Tutorial.show()
	tutorial_animation.play("end_eat")
	done_prompt_shown.emit()
	await station_arr[STATIONS.EAT].eat_finished
	$Tutorial.hide()

	# pizza grading cutscene
	await cut_scene.animation_finished
	$Tutorial.show()
	
	# shop tutorial
	tutorial_animation.play("go_shop")
	await station_arr[STATIONS.SHOP].opened
	side_bar.set_disable(true)
	tutorial_animation.play("explain_shop")
	await tutorial_button.button_up
	side_bar.set_disable(false)
	
	# ending
	tutorial_animation.play("go_order")
	await station_arr[STATIONS.ORDER].opened
	side_bar.set_disable(true)
	tutorial_animation.play("final")
	await tutorial_button.button_up
	side_bar.set_disable(false)
	
	# tutorial done 
	$Tutorial.queue_free()
	is_in_tutorial = false
	station_arr[STATIONS.ORDER].spawn_customer()
	

#function to change station, new station is an int from the station enum
func change_station(new_station):
	#close old station
	current_station.hide()
	current_station.station_closed()
	#open new one
	current_station = station_arr[new_station]
	current_station.show()
	current_station.station_opened()

func show_cut_scene():
	$CutScene.show()
func hide_cut_scene():
	$CutScene.hide()

func pause_music():
	$Music.stop()
func play_music():
	$Music.play()
