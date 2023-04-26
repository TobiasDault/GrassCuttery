extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Back_pressed():
	get_tree().change_scene("res://MainMenu.tscn")


func _on_CheckButton_toggled(button_pressed):
	if(button_pressed):
		MusicController.enable()
	else:
		MusicController.disable()


func _on_CheckButton2_toggled(button_pressed):
	if(button_pressed):
		SfxController.enable()
	else:
		SfxController.disable()
