extends Node2D

@onready var level_one = $levelOne

@export var complete_level_one = false
@export var complete_level_two = false

func _ready():
	level_one.visible = true
	

