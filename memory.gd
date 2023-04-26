extends Node

# This file is very cool. It implements Godot's "Singletons (Autoload)", but it basically has this scene that is always loaded.
# It allows for any value we use here to be changed and accessed at any point by other files, just by calling it like the following
# onready var memory = $"/root/Memory"
# memory.ferilizer["cost"] = 0
# pretty nifty

var money: = 0 # FOR TESTING PURPOSES
var firstTime = true
var grassHeight: = 0
var fertilizer ={ # I prefered using a dictionary over making a ton of variables, which I believe will make things less cluttered
	"cost" : 50,
	"level": 0,
	# This field actually puts the fertilizer into effect
	"multiplier": 1
}
var irrigation ={
	"cost" : 50,
	"level": 0,
	# This field puts the irrigation into effect
	"multiplier": 1
}
var autoGrow = false
var autoMulti = 1
var frame = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _process(delta): #runs every frame (60fps)
	frame += 1
	if(autoGrow and frame > (60/autoMulti)): # +1 grassHeight per second with autoMulti value of 1 (default)
		grassHeight += 1
		frame = 0 # reset frame counter
