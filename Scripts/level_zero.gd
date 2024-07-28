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
	GlobalFunc.seq = 1
	#play_scene_1()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GlobalFunc.d_active == false:
		match GlobalFunc.seq:
			1:
				GlobalFunc.d_active = true
				DialogueManager.show_dialogue_balloon(dialogue_resource, "opening_scene_1")
			2:
				_1_knock.play()
				GlobalFunc.d_active = true
				await(get_tree().create_timer(1).timeout)
				GlobalFunc.d_active = false
				GlobalFunc.seq = 3
			3:
				GlobalFunc.d_active = true
				DialogueManager.show_dialogue_balloon(dialogue_resource, "opening_scene_2")
			4:
				GlobalFunc.d_active = true
				DialogueManager.show_dialogue_balloon(dialogue_resource, "opening_scene_3")
				note.visible = true
				await(get_tree().create_timer(4).timeout)
				note.visible = false
			5:
				GlobalFunc.d_active = true
				DialogueManager.show_dialogue_balloon(dialogue_resource, "opening_scene_4")
				await(get_tree().create_timer(3).timeout)
				_2_soup.play()
			6:
				GlobalFunc.d_active = true
				DialogueManager.show_dialogue_balloon(dialogue_resource, "opening_scene_5")
			7:
				GlobalFunc.d_active = true
				fade.visible = true
				await(get_tree().create_timer(2).timeout)
				alchemisthouse.visible = false
				cavebg.visible = true
				await(get_tree().create_timer(2).timeout)
				fade.visible = false
				await(get_tree().create_timer(2).timeout)
				umbra.visible = false
				assassin.visible = true
				GlobalFunc.d_active = false
				GlobalFunc.seq = 8
			8:
				GlobalFunc.d_active = true
				DialogueManager.show_dialogue_balloon(dialogue_resource, "opening_scene_6")
			9:
				GlobalFunc.d_active = true
				splosions.play()
				splosions_2.play()
				splosions_3.play()
				fade.visible = true
				
				

#func play_scene_1():


	#DialogueManager.show_dialogue_balloon(dialogue_resource, "opening_scene_1")
	#_1_knock.play()
	#DialogueManager.show_dialogue_balloon(dialogue_resource, "opening_scene_2")
		

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
	#await(get_tree().create_timer(6).timeout)
	#splosions.play()
	#splosions_2.play()
	#splosions_3.play()
	#fade.visible = true
	# go to level 1
