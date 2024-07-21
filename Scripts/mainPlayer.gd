class_name Player
extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var state_machine = $stateMachine
@onready var ray_l = $RayL
@onready var ray_r = $RayR

const SPEED = 400.0
const DASH_SPEED = 2000.0
const JUMP_VELOCITY = -700.0
@onready var slide_timer = $slide_timer

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
	



#
#func _physics_process(delta):
	#if not is_on_floor():
		#velocity.y += gravity * delta
#
	#if Input.is_action_just_pressed("jump") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	#var direction = Input.get_axis("move_left", "move_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
#
	#if is_on_floor():
		#if direction == 0:
			#animated_sprite.play("idle")
		#else:
			#animated_sprite.play("walking")
			#
	#if direction > 0:
		#animated_sprite.flip_h = false
	#elif direction < 0:
		#animated_sprite.flip_h = true
		#
	#if !sliding && Input.is_action_just_pressed("dash"):
		#sliding = true
		#velocity.x = DASH_SPEED
		#slide_timer.start()
	#move_and_slide()
	#
#func _on_slide_timer_timeout():
	#velocity.x = move_toward(velocity.x, 0, SPEED)	
	#animated_sprite.play("idle")
	#sliding = false
