extends Node2D

onready var grass_sprites = get_tree().get_nodes_in_group("grass-sprites")
var max_stage = 9
var sprite_stages = {}

func _ready():
	grass_sprites = get_tree().get_nodes_in_group("grass-sprites")
	for sprite in grass_sprites:
		sprite_stages[sprite] = 0
		
	var CutButton = get_node("CutButton")
	CutButton.connect("pressed", self, "_on_cut_button_pressed")

		
func _input(event):
	if event is InputEventMouseButton and event.pressed:
		for sprite in grass_sprites:
			sprite_stages[sprite] += 1
			if sprite_stages[sprite] > max_stage:
				sprite_stages[sprite] = max_stage
			sprite.frame = sprite_stages[sprite]
			

func _on_cut_button_pressed():
	# Reset the stage of each sprite to 0
	for sprite in grass_sprites:
		sprite_stages[sprite] = 0
		sprite.frame = 0