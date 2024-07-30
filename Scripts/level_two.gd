extends Node2D
@onready var main_player = $mainPlayer
@onready var assassin_player = $mainPlayer/Assassin
@onready var pause_menu = $CanvasLayer/PauseMenu

var level_two =  preload("res://Scenes/level_two.tscn")
var paused = false

func _ready():
	#$mainPlayer/Assassin/Camera2D.limit_top = -1900
	#$mainPlayer/Assassin/Camera2D.limit_right = 1400
	#$mainPlayer/Assassin/Camera2D.limit_left = -500
	assassin_player.global_position.y = -280
	assassin_player.global_position.x = 0

func _unhandled_input(event):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()

func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	paused = !paused

func restartLevel():
	#queue_free()
	#var game_scene = level_two.instantiate()
	#get_parent().add_child(game_scene)
	Engine.time_scale = 1
	get_tree().change_scene_to_file("res://Scenes/level_two.tscn")
