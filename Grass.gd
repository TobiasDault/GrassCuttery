extends Area2D
signal grass_cut(grass_height)
@export_enum("Uncuttable", "Cuttable", "Overgrown") var growths

# Grass Script
# Contains grass growth formula
# On being cut it sends a signal to main to award coins.
# Receives a signal from Cutters to be cut.

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func calculate_grass_growth():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	calculate_grass_growth()
	pass

# Receive signal from Cutter.
func _on_cutter_input_event(viewport, event, shape_idx):
	match self.growths:
		# Overgrown has 50% reduction in coins
		# Uncuttable should have nothing
		# Cuttable gives 100% coins
		"Overgrown": pass
		"Uncuttable": pass
		"Cuttable": pass
	pass # Replace with function body.
