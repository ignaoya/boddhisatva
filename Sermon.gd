extends Node2D

var sayings = {
	1: "Our life is shaped by our mind; we become what we think.",
	2: "The earnest spiritual aspirant, fearing sloth, advances like a fire, burning all fetters.",
	3: "More than those who hate you, more than all your enemies, an undisciplined mind does greater harm.",
	4: "Many garlands can be made from a heap of flowers. Many good deeds can be done in this life.",
	5: "If you find no one to support you on the spiritual path, walk alone.",
	6: "Few are those who reach the other shore; most people keep running up and down this shore.",
	7: "Better than a speech of a thousand vain words is one thoughtful word which brings peace to the mind.",
	8: "Before trying to guide others, be your own guide first. It is hard to learn to guide oneself.",
	9: "Even celestial pleasures cannot quench the passions.",
	10: "You are like a withered leaf, waiting for the messenger of death. You are about to go on a long journey, but you are so unprepared."
}

func _ready():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	var x = rng.randi_range(1, 10)
	get_node("Saying").set_text(sayings[x])
	
func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://World.tscn")
