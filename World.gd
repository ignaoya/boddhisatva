extends YSort

onready var Burger = load("res://Karma/KarmaBurger.tscn")
onready var Beer = load("res://Karma/KarmaBeer.tscn")
onready var Casino = load("res://Karma/KarmaCasino.tscn")
onready var Hub = load("res://Karma/KarmaHub.tscn")
var time = 0.0
var counter = 0
var rng = RandomNumberGenerator.new()
var karma

func _process(delta):
	get_node("Score").set_text(str(Global.karmicPoints))
	time += delta
	if time > 10.0:
		get_tree().change_scene("res://Zen Time.tscn")
	if int(time) > counter:
		counter += 1
		var main = get_tree().current_scene
		if  counter % 2 == 0:
			pass
		elif counter % 8 == 1:
			karma = Burger.instance()
		elif counter % 8 == 3:
			karma = Beer.instance()
		elif counter % 8 == 5:
			karma = Casino.instance()
		else:
			karma = Hub.instance()
		if counter % 2 != 0:
			main.add_child(karma)
			rng.randomize()
			var x = rng.randi_range(20, 300)
			var y = rng.randi_range(20, 160)
			karma.global_position = Vector2(x, y)
