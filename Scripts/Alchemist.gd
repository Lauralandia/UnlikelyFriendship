class_name AlchemistClass
extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var state_machine = $stateMachine

@onready var assassin = $"../Assassin"
@onready var assassin_cam = $"../Assassin/Camera2D"
@onready var str_timer = $StrTimer
@onready var str_sprite = $Str_Sprite

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

var sliding = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var strength_duration = 5
var str_active = false

func _ready() -> void:
	state_machine.init(self)

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("skill_one") && str_timer.time_left == 0:
		animated_sprite.play("drink_str")
		await(get_tree().create_timer(0.5).timeout)
		str_active = true
		str_sprite.visible = true
		str_sprite.play("str")
		str_timer.start(strength_duration)
		
	state_machine.process_input(event)
	
func _physics_process(delta: float) -> void:
	state_machine.process_physics(delta)
	
func _process(delta: float) -> void:
	state_machine.process_frame(delta)

func _on_str_timer_timeout():
	str_active = false
	str_sprite.visible = false
	

