extends Area2D

var level_two =  preload("res://Scenes/level_two.tscn")
var entered = false

func _on_body_entered(body):
	if body.is_in_group("player"):
		entered = true

func _on_body_exited(body):
	if body.is_in_group("player"):
		entered = false
	
func _process(delta):
	if entered == true:
		if Input.is_action_just_pressed("interact"):
			get_tree().change_scene_to_file("res://Scenes/level_two.tscn")
