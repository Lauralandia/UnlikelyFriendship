extends Node2D
@onready var main_player = $mainPlayer
@onready var assassin_player = $mainPlayer/Assassin

func _ready():
	$mainPlayer/Assassin/Camera2D.limit_top = -1900
	$mainPlayer/Assassin/Camera2D.limit_right = 1400
	$mainPlayer/Assassin/Camera2D.limit_left = -500
	assassin_player.global_position.y = -1300
	assassin_player.global_position.x = -250

