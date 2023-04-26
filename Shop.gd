extends Control

var fertilizer_level = 0
var irrigation_level = 0
var fertilizer_cost = 50
var irrigation_cost = 50
onready var money_label = $MoneyLabel
onready var fertilizer_label = $VBoxContainer1/Level1
onready var irrigation_label = $VBoxContainer2/Level2
onready var cost1_lable = $VBoxContainer1/Cost1
onready var cost2_lable = $VBoxContainer2/Cost2
onready var memory = $"/root/Memory"

# Called when the node enters the scene tree for the first time.
func _ready():
	money_label.text = "Money: " + str(memory.money)

func _on_Fertilizer_pressed():
	fertilizer_level += 1
	fertilizer_label.text = "Current Level: " + str(fertilizer_level)
	fertilizer_cost *= 1.05
	cost1_lable.text = "Cost: " + str(int(fertilizer_cost))
	
func _on_Irrigation_pressed():
	irrigation_level += 1
	irrigation_label.text = "Current Level: " + str(irrigation_level)
	irrigation_cost *= 1.05
	cost2_lable.text = "Cost: " + str(int(irrigation_cost))

func _on_BackButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Game.tscn")
