extends Node2D
@onready var _0_bgmusic = $"sounds/0-bgmusic"
@onready var bgmusic_2 = $sounds/bgmusic2
@onready var _1_knock = $"sounds/1-knock"
@onready var note = $assets/note
@onready var _2_soup = $"sounds/2-soup"
@onready var fade = $fade
@onready var alchemisthouse = $bg/alchemisthouse
@onready var cavebg = $bg/cavebg
@onready var alchemist = $assets/Alchemist
@onready var umbra = $assets/Umbra
@onready var assassin = $assets/Assassin
@onready var splosions = $sounds/splosions
@onready var splosions_2 = $sounds/splosions2
@onready var splosions_3 = $sounds/splosions3

@export var dialogue_resource: DialogueResource
var is_dialogue_ended: DialogueLine

#var open_scene_1 = DialogueManager.show_dialogue_balloon(dialogue_resource, "opening_scene_1")
#var open_scene_2 = DialogueManager.show_dialogue_balloon(dialogue_resource, "opening_scene_2")
#var open_scene_3 = DialogueManager.show_dialogue_balloon(dialogue_resource, "opening_scene_3")
#var open_scene_4 = DialogueManager.show_dialogue_balloon(dialogue_resource, "opening_scene_4")
#var open_scene_5 = DialogueManager.show_dialogue_balloon(dialogue_resource, "opening_scene_5")


func _ready():
	# play music
	_0_bgmusic.play()
	play_scene_1()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func play_scene_1():
	# play opening_scene dialogue
	print(1)
	DialogueManager.show_dialogue_balloon(dialogue_resource, "opening_scene_1")
	# mail
	print(is_dialogue_ended)
	
	if await(get_tree().create_timer(2).timeout):
		_1_knock.play()
		print(2)
		DialogueManager.show_dialogue_balloon(dialogue_resource, "opening_scene_2")
		

	print(3)
	DialogueManager.show_dialogue_balloon(dialogue_resource, "opening_scene_3")
	# parchment screen
	
	#await(get_tree().create_timer(8).timeout)
	#note.visible = true
	#await(get_tree().create_timer(4).timeout)
	#note.visible = false
	#print(3)
	#DialogueManager.show_dialogue_balloon(dialogue_resource, "opening_scene_3")
	#await(get_tree().create_timer(6).timeout)
	#print(4)
	#DialogueManager.show_dialogue_balloon(dialogue_resource, "opening_scene_4")
	## but what about the soup
	#await(get_tree().create_timer(4).timeout)
	#_2_soup.play()
	## leave to cave
	#await(get_tree().create_timer(8).timeout)
	#fade.visible = true
	#await(get_tree().create_timer(2).timeout)
	#alchemisthouse.visible = false
	#cavebg.visible = true
	#await(get_tree().create_timer(2).timeout)
	#fade.visible = false
	#print(5)
	#DialogueManager.show_dialogue_balloon(dialogue_resource, "opening_scene_5")
	#await(get_tree().create_timer(4).timeout)
	## umbra disappears
	#umbra.visible = false
	#assassin.visible = true
	## assassin appears
	#print(6)
	#DialogueManager.show_dialogue_balloon(dialogue_resource, "opening_scene_6")
	# explosions, cave crashes
	await(get_tree().create_timer(6).timeout)
	splosions.play()
	splosions_2.play()
	splosions_3.play()
	fade.visible = true
	# go to level 1
