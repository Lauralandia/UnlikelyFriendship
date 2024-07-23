extends Node2D

var level_one =  preload("res://Scenes/level_one.tscn")
var level_two =  preload("res://Scenes/level_two.tscn")

@export var complete_level_one = false
@export var complete_level_two = false

func _ready():
	var game_scene = level_one.instantiate()
	add_child(game_scene)

