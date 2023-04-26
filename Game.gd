extends Node2D

onready var grass_sprites = get_tree().get_nodes_in_group("grass-sprites")
var max_stage = 19
var sprite_stages = {}
onready var money_label = $MoneyLabel
onready var memory = $"/root/Memory"
var temp = 0

func _ready():
	money_label.text = "Money: " + str(memory.money)
	grass_sprites = get_tree().get_nodes_in_group("grass-sprites")
	for sprite in grass_sprites:
		sprite_stages[sprite] = 0
		
	var CutButton = get_node("CutButton")
	CutButton.connect("pressed", self, "_on_cut_button_pressed")
	
	var BackButton = get_node("BackButton")
	BackButton.connect("pressed", self, "_on_BackButton_pressed")
	
	var ShopButton = get_node("ShopButton")
	ShopButton.connect("pressed", self, "_on_ShopButton_pressed")

		
func _input(event):
	if event is InputEventMouseButton and event.pressed:
		for sprite in grass_sprites:
			sprite_stages[sprite] += 1
			temp = sprite_stages[sprite]
			if sprite_stages[sprite] > max_stage:
				sprite_stages[sprite] = max_stage
				temp = max_stage
			sprite.frame = sprite_stages[sprite]
			

func _on_cut_button_pressed():
	# Reset the stage of each sprite to 0
	memory.money += temp
	#print("i: " + str(i))
	for sprite in grass_sprites:
		sprite_stages[sprite] = 0
		sprite.frame = 0
	money_label.text = "Money: " + str(memory.money)
func _on_BackButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://MainMenu.tscn")

func _on_ShopButton_pressed():
# warning-ignore:return_value_discarded
	
	get_tree().change_scene("res://Shop.tscn")	
	
