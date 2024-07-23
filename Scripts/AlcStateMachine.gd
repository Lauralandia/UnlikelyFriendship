extends Node

@export var starting_state: AlcState
var current_state: AlcState

func init(parent: AlchemistClass) -> void:
	for child in get_children():
		child.parent = parent	
	change_state (starting_state)

func change_state (new_state: AlcState) -> void:
	if current_state:
		current_state.exit()
	current_state = new_state
	current_state.enter()
	
func process_physics(delta: float)-> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)
	
func process_input(event: InputEvent) -> void:
	#if Input.is_action_just_pressed("switch_character"):
		#var current_pos = get_parent().global_position
		#get_parent().queue_free()
		#var new_char = assassin_char.instantiate()
		#new_char.global_position = current_pos		
		#get_parent().get_parent().add_child(new_char)
		
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)

func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)
