extends Area2D
signal grass_cut(grass_height)
@export_enum("Uncuttable", "Cuttable", "Overgrown") var growths

# Grass Script
# Contains grass growth formula
# On being cut it sends a signal to main to award coins.
# Receives a signal from Cutters to be cut.

# Called when the node enters the scene tree for the first time.
func _ready():
	self.growths = "Uncuttable"
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# Receive signal from Cutter.
func _on_cutter_input_event(viewport, event, shape_idx):
	grass_cut.emit(self.growths)


func _on_timer_timeout():
	match self.growths:
		"Uncuttable":
			self.growths = "Cuttable"
		"Cuttable":
			self.growths = "Overgrown"
		"Overgrown":
			self.growths = "Overgrown"
	pass # Replace with function body.
