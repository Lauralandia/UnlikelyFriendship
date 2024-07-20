extends Control

func _ready():
	get_node("mainMenu/ColorRect/PanelContainer/VBoxContainer/NewGame").pressed.connect(on_new_game_pressed)
	#get_node("mainMenu/ColorRect/PanelContainer/VBoxContainer/ExitGame").pressed.connect(on_exit_game_pressed)

func on_new_game_pressed():
	get_node("mainMenu").queue_free()
	var game_scene = load("res://Scenes/main_game.tscn").instantiate()
	add_child(game_scene)
	
func _on_exit_game_pressed():
	get_tree().quit()
