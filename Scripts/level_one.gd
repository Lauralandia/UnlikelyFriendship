extends Node2D
@onready var assassin_player = $mainPlayer/Assassin
@onready var pause_menu = $CanvasLayer/PauseMenu

@onready var start_col = $Lvl1DialogueTree/start/CollisionShape2D
@onready var jump_tut = $Lvl1DialogueTree/jumptut/CollisionShape2D
@onready var dash_tut = $Lvl1DialogueTree/dashtut/CollisionShape2D
@onready var walljump_tut = $Lvl1DialogueTree/walljumptut/CollisionShape2D
@onready var push_tut = $Lvl1DialogueTree/push_tutorial/CollisionShape2D
@onready var disable_tut = $CanvasLayer/DisableTut
@onready var disable_rect = $CanvasLayer/ColorRect

var paused = false

func _ready():
	assassin_player.global_position.y = 0
	assassin_player.global_position.x = 0
	
	if GlobalFunc.skip_intro == true:
		start_col.disabled = true

func _unhandled_input(_event):
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
	get_tree().change_scene_to_file("res://Scenes/level_one.tscn")
	

func _on_button_pressed():
	jump_tut.disabled = true
	dash_tut.disabled = true
	walljump_tut.disabled = true
	push_tut.disabled = true
	disable_tut.visible = false
	disable_rect.visible = false
