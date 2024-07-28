extends Node
@onready var bell_2 = $Bell2


var test = ""

func _process(delta):
	if test != "":
		print(test)

func hello():
	bell_2.play()


