extends StaticBody2D

var speed

func _ready():
	if Global.karmicPoints > 0:
		speed = 10 / Global.karmicPoints
	else:
		speed = 10

func _process(delta):
	if Global.karmicPoints > 0:
		speed = 10 / Global.karmicPoints
	else:
		speed = 10
	var pos = get_position()
	if pos.y < 10000:
		pos.y += speed
	set_position(pos)
	if pos.y > 8800:
		Global.enlightened = true
		Global.karmicPoints = 0

