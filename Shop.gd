extends Control

onready var money_label = $MoneyLabel
onready var fertilizer_label = $FertilizerCont/Level1
onready var irrigation_label = $IrrigationCont/Level2
onready var cost1_lable = $FertilizerCont/Cost1
onready var cost2_lable = $IrrigationCont/Cost2
onready var autoMulti_label = $AutoGrowCont/autoMultiLabel
onready var memory = $"/root/Memory" # this variable allows access to "global variables" stored in memory.gd

# Called when the scene is loaded
func _ready(): # setting each label to its correct value according to what is stored in "memory"
	money_label.text = "Money: " + str(memory.money)
	
	fertilizer_label.text = "Current Level: " + str(int(memory.fertilizer["level"]))
	cost1_lable.text = "Cost: " + str(int(memory.fertilizer["cost"]))
	
	irrigation_label.text = "Current Level: " + str(int(memory.irrigation["level"]))
	cost2_lable.text = "Cost: " + str(int(memory.irrigation["cost"]))
	
	autoMulti_label.text = "Mutliplier: " + str(memory.autoMulti) + "x"

func _on_Fertilizer_pressed():
	if(memory.money >= memory.fertilizer["cost"]): # checks if we can afford this purchase
		memory.money -= memory.fertilizer["cost"] # subtracts the cost from our balance
		memory.fertilizer["level"] += 1
		fertilizer_label.text = "Current Level: " + str(memory.fertilizer["level"])
		memory.fertilizer["cost"] *= 1.05 # arbitrary multiplier for scaling upgrade prices
		cost1_lable.text = "Cost: " + str(int(memory.fertilizer["cost"]))
		money_label.text = "Money: " + str(memory.money)
	
	
func _on_Irrigation_pressed():
	if(memory.money >= memory.irrigation["cost"]): # checks if we can afford this purchase
		memory.money -= memory.irrigation["cost"] # subtracts the cost from our balance
		memory.irrigation["level"] += 1
		irrigation_label.text = "Current Level: " + str(memory.irrigation["level"])
		memory.irrigation["cost"] *= 1.05
		cost2_lable.text = "Cost: " + str(int(memory.irrigation["cost"]))
		money_label.text = "Money: " + str(memory.money)

func _on_BackButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Game.tscn")


func _on_AutoGrow_pressed(): # toggles autoGrow feature
	if(memory.autoGrow):
		memory.autoGrow = false
	else:
		memory.autoGrow = true # there's gotta be some better way to do this, but Godot doesn't have ternary operators...
