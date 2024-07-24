extends AlcState

@export var fall_state: AlcState
@export var idle_state: AlcState
@export var jump_state: AlcState

func process_input(event: InputEvent) -> AlcState:
	if Input.is_action_just_pressed('jump') and parent.is_on_floor():
		return jump_state
	return null

func process_physics(delta: float) -> AlcState:
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
	
	if parent.str_active == true:
		for i in parent.get_slide_collision_count():
			var c = parent.get_slide_collision(i)
			if c.get_collider() is RigidBody2D:
				c.get_collider().apply_central_impulse(-c.get_normal()*80.0)
				
	if !parent.is_on_floor():
		return fall_state
	return null
