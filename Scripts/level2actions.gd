extends Area2D
@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "level_2_a"
@onready var main_player = $"../../mainPlayer"
@onready var bellring = $CollisionShape2D/bellring

var played = false

func _on_body_entered(body):
	if body.is_in_group("player") and played == false:
		GlobalFunc.d_active = true
		DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_start)
		played = true
	if dialogue_start == "level_2_a":
		bellring.play()
