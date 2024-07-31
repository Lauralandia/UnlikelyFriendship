extends AlcState

@export var fall_state: AlcState
@export var idle_state: AlcState
@export var move_state: AlcState
@export var jump_force: float = 900.0
@onready var jump_sound = $"../../JumpSound"

func enter() -> void:
	super()
	jump_sound.play()
	parent.animated_sprite.play("jump")
	parent.velocity.y = -jump_force

func process_physics(delta: float) -> AlcState:
	parent.velocity.y +=  gravity*delta
	
	if parent.velocity.y > 0:
		return fall_state
	
	var movement = Input.get_axis('move_left', 'move_right') * move_speed
	
	if movement != 0:
		parent.animated_sprite.flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if movement != 0:
			return move_state
		return idle_state
		
	return null