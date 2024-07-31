extends Node2D

@export var dialogue_resource: DialogueResource
var is_dialogue_ended: DialogueLine
@onready var garble_2 = $sounds/garble2
@onready var garble = $sounds/garble
@onready var potiongulp = $sounds/potiongulp
@onready var umbra = $assets/umbra
@onready var bigumbra_2 = $assets/bigumbra2
@onready var feintumbra = $assets/feintumbra
@onready var assassin = $assets/assassin
@onready var alchemist = $assets/alchemist
@onready var deathsound = $sounds/deathsound
@onready var flask = $assets/flask
@onready var fade = $assets/fade
@onready var theend = $assets/theend
@onready var maintheme = $sounds/maintheme

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalFunc.seq = 11
	alchemist.play("idle")
	assassin.play("idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GlobalFunc.d_active == false:
		match GlobalFunc.seq:
			11:
				# umbra in middle of screen on its side
				GlobalFunc.d_active = true
				DialogueManager.show_dialogue_balloon(dialogue_resource, "level_3_a")
				GlobalFunc.seq = 12
			12:
				garble_2.play()
				GlobalFunc.d_active = true
				DialogueManager.show_dialogue_balloon(dialogue_resource, "level_3_b")
				GlobalFunc.seq = 13
			13:
				garble.play()
				GlobalFunc.d_active = true
				DialogueManager.show_dialogue_balloon(dialogue_resource, "level_3_c")
				umbra.play("run")
				GlobalFunc.seq = 14
			14:
				GlobalFunc.d_active = true
				umbra.play("idle")
				DialogueManager.show_dialogue_balloon(dialogue_resource, "level_3_d")
				GlobalFunc.seq = 15
			15:
				GlobalFunc.d_active = true
				DialogueManager.show_dialogue_balloon(dialogue_resource, "level_3_e")
				
			16:
				GlobalFunc.d_active = true
				potiongulp.play()
				umbra.play("default")
				await(get_tree().create_timer(2).timeout)
				# garble_2.play()
				GlobalFunc.d_active = false
				GlobalFunc.seq = 17
			17:
				GlobalFunc.d_active = true
				umbra.visible = false
				bigumbra_2.visible = true
				bigumbra_2.play('surprise')
				await(get_tree().create_timer(2).timeout)
				GlobalFunc.d_active = false
				GlobalFunc.seq = 18
			18:
				GlobalFunc.d_active = true
				# put umbra on side
				deathsound.play()
				await(get_tree().create_timer(2).timeout)
				bigumbra_2.visible = false
				feintumbra.visible = true
				GlobalFunc.d_active = false
				GlobalFunc.seq = 19
			19:
				GlobalFunc.d_active = true
				DialogueManager.show_dialogue_balloon(dialogue_resource, "level_3_f")
				# show potion label
			20:
				GlobalFunc.d_active = true
				flask.visible = true
				await(get_tree().create_timer(3).timeout)
				flask.visible = false
				GlobalFunc.d_active = false
				GlobalFunc.seq = 21
			21:
				GlobalFunc.d_active = true
				DialogueManager.show_dialogue_balloon(dialogue_resource, "level_3_g")
			22:
				GlobalFunc.d_active = true
				fade.visible = true
				theend.visible = true
				maintheme.play()
				#await(get_tree().create_timer(5).timeout)
				umbra.z_index = 1
				umbra.move_local_y(-355)
				umbra.visible = true
				umbra.play("run")
				alchemist.z_index = 1
				alchemist.move_local_y(-355)
				alchemist.visible = true
				alchemist.play('run')
				assassin.z_index = 1
				assassin.move_local_y(-355)
				assassin.visible = true
				assassin.play('run')
				# go to credits
