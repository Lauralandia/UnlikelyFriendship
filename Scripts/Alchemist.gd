class_name AlchemistClass
extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var state_machine = $stateMachine

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var sliding = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	state_machine.process_input(event)
	
func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	
func _process(delta: float) -> void:
	state_machine.process_frame(delta)
