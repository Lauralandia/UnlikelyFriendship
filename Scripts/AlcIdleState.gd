extends AlcState

@export var fall_state: AlcState
@export var jump_state: AlcState
@export var move_state: AlcState

func enter() -> void:
	super()
	parent.velocity.x = 0
	parent.animated_sprite.play("idle")

func process_input (event: InputEvent) -> AlcState:
	if Input.is_action_just_pressed('jump') and parent.is_on_floor():
		return jump_state
	if Input.is_action_just_pressed('move_left') or Input.is_action_just_pressed('move_right'):
		return move_state
	return null
	
func process_physics(delta: float) -> AlcState:
	parent.velocity.y += gravity*delta
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fall_state		
	return null
