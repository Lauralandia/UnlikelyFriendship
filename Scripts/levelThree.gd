extends Node2D

@export var dialogue_resource: DialogueResource
var is_dialogue_ended: DialogueLine

# Called when the node enters the scene tree for the first time.
func _ready():
	
	GlobalFunc.seq = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GlobalFunc.d_active == false:
		match GlobalFunc.seq:
			11:
				# umbra in middle of screen on its side
				GlobalFunc.d_active = true
				DialogueManager.show_dialogue_balloon(dialogue_resource, "level_3_a")
			12:
				#
				GlobalFunc.d_active = true
				DialogueManager.show_dialogue_balloon(dialogue_resource, "level_3_b")
			13:
				GlobalFunc.d_active = true
				DialogueManager.show_dialogue_balloon(dialogue_resource, "level_3_c")
			14:
				GlobalFunc.d_active = true
				DialogueManager.show_dialogue_balloon(dialogue_resource, "level_3_d")
				
