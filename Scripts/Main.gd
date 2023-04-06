extends Node

var coins = 0
enum weather_enum {
	Sunny,
	Cloudy
}
var weather = weather_enum.Sunny

# Main Script
# 1. Game Loop
# 2. Weather Conditions
# 3. Growth Checks
# 4. 

# Called when the node enters the scene tree for the first time.
func _ready():
	var grass = get_node("Grass")
	grass.grass_cut.connect(_on_grass_grass_cut)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_grass_grass_cut(grass_height):
	# Coin amount can be adjusted
	match grass_height:
		"Uncuttable": pass
		"Cuttable": coins += 100
		"Overgrown": coins += 50
	pass # Replace with function body.


func _on_weather_timer_timeout():
	match weather:
		weather_enum.Sunny:
			weather = weather_enum.Cloudy
		weather_enum.Cloudy:
			weather = weather_enum.Sunny
