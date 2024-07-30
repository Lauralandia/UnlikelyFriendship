extends Node2D
@onready var main_player = $mainPlayer
@onready var assassin_player = $mainPlayer/Assassin
@onready var pause_menu = $CanvasLayer/PauseMenu

var paused = false

func _ready():
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
	Engine.time_scale = 1
	get_tree().change_scene_to_file("res://Scenes/level_two.tscn")
