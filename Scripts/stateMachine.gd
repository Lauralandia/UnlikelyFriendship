extends Node

@export var starting_state: State
var current_state: State
@onready var alchemist = $"../../Alchemist"


func init(parent: Player) -> void:
	for child in get_children():
		child.parent = parent
	
	change_state (starting_state)

func change_state (new_state: State) -> void:
	if current_state:
		current_state.exit()
		
	current_state = new_state
	current_state.enter()
	
func process_physics(delta: float)-> void:
	var new_state = current_state.process_physics(delta)
	if new_state:
		change_state(new_state)
	
func process_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("switch_character"):
		get_parent().visible = false
		alchemist.position = get_parent().position
		alchemist.visible = true
	
	var new_state = current_state.process_input(event)
	if new_state:
		change_state(new_state)

func process_frame(delta: float) -> void:
	var new_state = current_state.process_frame(delta)
	if new_state:
		change_state(new_state)
		
	
