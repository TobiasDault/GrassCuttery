extends Control

onready var money_label = $MoneyLabel
onready var fertilizer_label = $FertilizerCont/Level1
onready var irrigation_label = $IrrigationCont/Level2
onready var cost1_lable = $FertilizerCont/Cost1
onready var cost2_lable = $IrrigationCont/Cost2
onready var memory = $"/root/Memory"

# Called when the node enters the scene tree for the first time.
func _ready():
	money_label.text = "Money: " + str(memory.money)
	fertilizer_label.text = "Current Level: " + str(int(memory.fertilizer["level"]))
	cost1_lable.text = "Cost: " + str(int(memory.fertilizer["cost"]))
	
	irrigation_label.text = "Current Level: " + str(int(memory.irrigation["level"]))
	cost2_lable.text = "Cost: " + str(int(memory.irrigation["cost"]))

func _on_Fertilizer_pressed():
	if(memory.money >= memory.fertilizer["cost"]):
		memory.money -= memory.fertilizer["cost"]
		memory.fertilizer["level"] += 1
		fertilizer_label.text = "Current Level: " + str(memory.fertilizer["level"])
		memory.fertilizer["cost"] *= 1.05
		cost1_lable.text = "Cost: " + str(int(memory.fertilizer["cost"]))
		money_label.text = "Money: " + str(memory.money)
	
	
func _on_Irrigation_pressed():
	if(memory.money >= memory.irrigation["cost"]):
		memory.irrigation["level"] += 1
		irrigation_label.text = "Current Level: " + str(memory.irrigation["level"])
		memory.irrigation["cost"] *= 1.05
		cost2_lable.text = "Cost: " + str(int(memory.irrigation["cost"]))
		money_label.text = "Money: " + str(memory.money)

func _on_BackButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Game.tscn")


func _on_AutoGrow_pressed():
	memory.autoGrow = true
