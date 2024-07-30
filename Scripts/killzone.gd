extends Area2D

@onready var timer = $Timer
@onready var game_over = $gameOver
@onready var death_sound = $death_sound

func _on_body_entered(body):
	print("You died!")
	death_sound.play()
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	
func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
