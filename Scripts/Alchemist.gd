class_name AlchemistClass
extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var state_machine = $stateMachine
@onready var assassin = $"../Assassin"
@onready var assassin_cam = $"../Assassin/Camera2D"

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var sliding = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready() -> void:
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	#if Input.is_action_just_pressed("switch_character"):
		#assassin.global_position = self.global_position
		#assassin_cam.make_current()
		#self.global_position.x = 0
		#self.global_position.y = 0
	state_machine.process_input(event)
	
func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	
func _process(delta: float) -> void:
	state_machine.process_frame(delta)
