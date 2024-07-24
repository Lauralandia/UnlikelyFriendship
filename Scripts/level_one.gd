extends Node2D
@onready var main_player = $mainPlayer
@onready var assassin_player = $mainPlayer/Assassin

func _ready():
	$mainPlayer/Assassin/Camera2D.limit_top = -3650
	$mainPlayer/Assassin/Camera2D.limit_right = 10455
	$mainPlayer/Assassin/Camera2D.limit_left = -500
	assassin_player.global_position.y = -850
	assassin_player.global_position.x = -200
