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

var level_one =  preload("res://Scenes/level_one.tscn")

func _ready():
	# play music
	_0_bgmusic.play()
	GlobalFunc.seq = 1
	#play_scene_1()
	alchemist.play("idle")
	assassin.play("idle")
	umbra.play('idle')

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
				await(get_tree().create_timer(6).timeout)
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
				await(get_tree().create_timer(1).timeout)
				fade.visible = false
				await(get_tree().create_timer(1).timeout)
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
				await(get_tree().create_timer(10).timeout)
				
				start_level_one()
				
func _unhandled_input(event):
	if Input.is_action_just_pressed("interact"):
		GlobalFunc.skip_intro = true
		start_level_one()
	
func start_level_one():
	_0_bgmusic.stop()
	GlobalFunc.seq = 10
	GlobalFunc.d_active = false
	#var game_scene = level_one.instantiate()
	#add_child(game_scene)
	get_tree().change_scene_to_file("res://Scenes/level_one.tscn")
