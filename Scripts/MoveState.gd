extends State

@export var fall_state: State
@export var idle_state: State
@export var jump_state: State
@export var dash_state: State
@export var wall_slide_state: State

func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed('jump') and parent.is_on_floor():
		return jump_state
	if Input.is_action_just_pressed('dash'):
		return dash_state
	return null

func process_physics(delta: float) -> State:
	parent.velocity.y += gravity * delta
	parent.animated_sprite.play("walking")
		
	if Input.is_action_just_pressed('move_left') and Input.is_action_just_pressed('move_right'):
		return idle_state
	
	var movement = Input.get_axis('move_left', 'move_right') * move_speed
	
	if movement == 0:
		return idle_state
	
	parent.animated_sprite.flip_h = movement < 0
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if !parent.is_on_floor():
		return fall_state
	return null
