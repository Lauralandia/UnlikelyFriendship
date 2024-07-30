extends State

@export var fall_state: State
@export var idle_state: State
@export var move_state: State
@export var jump_state: State
@export var wall_slide_state: State
@onready var dash_sound = $"../../DashSound"

@export var dash_speed: float = 1500.0
@onready var dash_timer = $DashTimer

@export var dash_length: float = 0.2

func enter() -> void:
	if !is_dashing():
		start_dash()

func process_physics(delta: float) -> State:
	parent.velocity.y = 0
	var dashing_speed
		
	if is_dashing():
		dashing_speed = dash_speed
		parent.animated_sprite.play('dash')
		dash_sound.play()
	else:
		dashing_speed = move_speed
	var movement = Input.get_axis('move_left', 'move_right') * dashing_speed
	
	if movement != 0:
		parent.animated_sprite.flip_h = movement < 0
		parent.velocity.x = movement
	parent.move_and_slide()
	
	if parent.is_on_floor():
		if movement == 0:
			return idle_state
		if !is_dashing() && movement != 0:
			return move_state
	elif !is_dashing():
		return fall_state
	return null

func start_dash():
	if dash_timer.is_stopped:
		dash_timer.wait_time = dash_length
		dash_timer.start()

func is_dashing():
	return dash_timer.time_left > 0
	
