extends Node2D

var level_zero =  preload("res://Scenes/level_zero.tscn")

func _ready():
	var game_scene = level_zero.instantiate()
	add_child(game_scene)

