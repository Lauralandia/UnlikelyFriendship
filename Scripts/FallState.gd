extends State

@export var jump_state: State
@export var idle_state: State
@export var move_state: State
@export var dash_state: State
@export var wall_slide_state: State

@export var jump_force: float = 900.0

func enter() -> void:
	parent.animated_sprite.play("fall")

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed('dash') && get_parent().get_parent().dashed == false:
		get_parent().get_parent().dashed = true
		return dash_state
	return null
	
func process_physics(delta: float) -> State:		
	if !parent.is_on_floor() and (parent.ray_l.is_colliding() or parent.ray_r.is_colliding()) and (Input.is_action_pressed('move_left') or Input.is_action_pressed('move_right')):
		get_parent().get_parent().dashed = false
		return wall_slide_state
		
	parent.velocity.y +=  gravity*delta	

	var movement = Input.get_axis('move_left', 'move_right') * move_speed
	
	if movement != 0:
		parent.animated_sprite.flip_h = movement < 0
		
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if parent.is_on_floor():
		get_parent().get_parent().dashed = false
		if movement != 0:
			return move_state
		return idle_state
		
	return null
