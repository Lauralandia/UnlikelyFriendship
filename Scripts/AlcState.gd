class_name AlcState
extends Node

@export var move_speed: float = 400
@export var animation_name: String

var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

var parent: AlchemistClass

func enter() -> void:
	parent.animated_sprite.play(animation_name)

func exit() -> void:
	pass
	
func process_input(event: InputEvent) -> AlcState:
	return null

func process_frame(delta: float) -> AlcState:
	return null
	
func process_physics(delta: float) -> AlcState:
	return null
