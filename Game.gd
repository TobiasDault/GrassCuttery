extends Node2D

onready var sprite = $GrassSprite
onready var animation_player = $GrassSprite/AnimationPlayer
onready var timer = $Timer
onready var area2D = $DetectMouse

var stage = 0
var max_stage = 2  # Change this to the total number of stages you have

func _ready():
	sprite.connect("mouse_entered", self, "_on_sprite_mouse_entered")
	timer.connect("timeout", self, "_on_timer_timeout")
	timer.start()

func _on_sprite_mouse_entered():
	stage = 0
	update_sprite()

func _on_timer_timeout():
	stage += 1
	if stage > max_stage:
		stage = max_stage
		timer.stop()
	update_sprite()

func update_sprite():
	sprite.frame = stage
	for child in area2D.get_children():
		if child is CollisionShape2D:
			child.disabled = true
			if child.name == "stage_" + str(stage + 1) + "_shape":
				child.disabled = false
