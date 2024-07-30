extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GlobalFunc.d_active == false:
		match GlobalFunc.seq:
			11:
				GlobalFunc.d_active = true
				# DialogueManager.show_dialogue_balloon(dialogue_resource, "")
