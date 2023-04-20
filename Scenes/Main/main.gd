extends Node2D

onready var GrassBlade = load("res://Scenes/Main/GrassBlade.tscn")
var grass_blades = []
var start_position = Vector2()
var end_position = Vector2()

const NUM_BLADES = 50
const GROWTH_SPEED = 50.0  # Adjust this value to control the growth speed

func _ready():
	for i in range(NUM_BLADES):
		var blade = GrassBlade.instantiate()
		var random = RandomNumberGenerator.new()
		blade.position = Vector2(random.randf_range(0, get_viewport_rect().size.x), get_viewport_rect().size.y + (get_viewport_rect().size.y / 2))
		add_child(blade)
		grass_blades.append(blade)
		
func _process(delta):
	for blade in grass_blades:
		if blade.global_position.y > 0:
			blade.global_position.y -= GROWTH_SPEED * delta

func _input(event):
	if event is InputEventMouseButton:
		if event.is_pressed():
			start_position = event.position
		else:
			end_position = event.position
			cut_grass()

func cut_grass():
	var cut_area = Rect2(start_position, end_position - start_position).abs()
	var coins_earned = 0

	for blade in grass_blades:
		var blade_area = blade.get_rect()
		if cut_area.intersects(blade_area):
			var intersection = cut_area.clip(blade_area)
			var cut_height = intersection.size.y / blade_area.size.y
			blade.material.set_shader_param("cut_area", Vector3(intersection.position.x / blade_area.size.x, cut_height, intersection.end.x / blade_area.size.x))

			coins_earned += int(cut_height * 100)

	print("Coins earned: %d" % coins_earned)
