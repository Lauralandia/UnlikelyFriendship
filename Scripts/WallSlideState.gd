extends State

@export var jump_state: State
@export var idle_state: State
@export var move_state: State
@export var dash_state: State
@export var fall_state: State

@export var slide_speed: float = 100

func enter() -> void:
	parent.animated_sprite.play("wall_slide")
	
func process_input(event: InputEvent) -> State:
	if Input.is_action_just_pressed('jump'):
		return jump_state
	if Input.is_action_just_pressed('dash'):
		return dash_state
	return null

func process_physics(delta: float) -> State:
	if !parent.is_on_floor() and (parent.ray_l.is_colliding() or parent.ray_r.is_colliding):
		if Input.is_action_pressed('move_left') or Input.is_action_pressed('move_right'):
			parent.velocity.y += slide_speed * delta
			#parent.velocity.y = min(parent.velocity.y, slide_speed)
		else:
			parent.velocity.y += gravity*delta
			return fall_state
	
	print(parent.velocity.y)	
	var movement = Input.get_axis('move_left', 'move_right') * move_speed
	
	if movement != 0:
		parent.animated_sprite.flip_h = movement > 0
		
	parent.velocity.x = movement
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if movement != 0:
			return move_state
		return idle_state
		
	return null
