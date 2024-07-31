extends Area2D

@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "level_1_start"
@onready var music = $"../../music"
@onready var bell_ring = $BellRing
@onready var main_player = $"../../mainPlayer"


var played = false

		
func _on_body_entered(body):
	if body.is_in_group("player") and played == false:
		GlobalFunc.d_active = true
		DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_start)
		played = true
	if dialogue_start == "level_1_start":
		bell_ring.play()

func _on_body_exited(body):
	#music.play()
	pass
