extends Node2D
@onready var main_player = $mainPlayer
@onready var assassin_player = $mainPlayer/Assassin

func _ready():
	$mainPlayer/Assassin/Camera2D.limit_top = -1650
	$mainPlayer/Assassin/Camera2D.limit_right = 3455
	$mainPlayer/Assassin/Camera2D.limit_left = -500
	assassin_player.global_position.y = -850
	assassin_player.global_position.x = -200
