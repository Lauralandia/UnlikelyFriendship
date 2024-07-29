extends Node

var alc_char =  preload("res://Scenes/alchemist.tscn")
var ass_char =  preload("res://Scenes/assassin.tscn")
@onready var ass_cam = $Assassin/Camera2D
@onready var alc_cam = $Alchemist/Camera2D
@onready var trans_cd = $trans_cd


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("switch_character") && trans_cd.time_left <= 0:
		for child in get_children():
			if child.name == "Assassin" && child.is_on_floor():
				child.velocity.x = 0
				var new_char = alc_char.instantiate()
				new_char.visible = false
				child.animated_sprite.play("transition")
				new_char.global_position = child.global_position
				#$Alchemist/Camera2D.limit_top = $Assassin/Camera2D.limit_top
				#$Alchemist/Camera2D.limit_right = $Assassin/Camera2D.limit_right
				#$Alchemist/Camera2D.limit_left = $Assassin/Camera2D.limit_left
				add_child(new_char)
				child.animated_sprite.play("transition")
				trans_cd.start(0.3)
				await(trans_cd.timeout)
				child.queue_free()
				new_char.visible = true
			elif child.name == "Alchemist" && child.is_on_floor():
				child.velocity.x = 0
				var new_char = ass_char.instantiate()
				new_char.visible = false
				child.animated_sprite.play("transition")
				new_char.global_position = child.global_position
				add_child(new_char)	
				child.animated_sprite.play("transition")
				trans_cd.start(0.3)
				await(trans_cd.timeout)
				child.queue_free()
				new_char.visible = true

