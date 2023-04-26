extends Node


var music1 = load("res://Audio/music1.ogg")
var tap1 = load("res://Audio/tap1.ogg")
var grassCut1 = load("res://Audio/grassCut1.ogg")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func play_music():
	$Music.stream = music1
	$Music.volume_db = -20
	$Music.play()

func enable():
	$Music.volume_db = -20
	
func disable():
	$Music.volume_db = -80

func tap():
	$Music.stream = tap1
	$Music.volume_db = -20
	$Music.play()

func cut():
	$Music.stream = grassCut1
	$Music.volume_db = -20
	$Music.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
