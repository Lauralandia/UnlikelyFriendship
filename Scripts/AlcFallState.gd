extends AlcState

@export var jump_state: AlcState
@export var idle_state: AlcState
@export var move_state: AlcState

@export var jump_force: float = 900.0

func enter() -> void:
	parent.animated_sprite.play("idle")
	
func process_physics(delta: float) -> AlcState:		
		
	parent.velocity.y +=  gravity*delta	

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
