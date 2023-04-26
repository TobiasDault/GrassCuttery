extends Node

var money: = 999999
var grassHeight: = 0
var fertilizer ={
	"cost" : 50,
	"level": 0
}
var irrigation ={
	"cost" : 50,
	"level": 0
}
var autoGrow = false
var autoMulti = 1
var frame = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): #runs every 0.016667s or 16.6667ms
	frame += 1
	if(autoGrow and frame > (60/autoMulti)):
		grassHeight += 1
		frame = 0
