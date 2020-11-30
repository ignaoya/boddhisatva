extends Node2D

onready var Meditator = load("res://MeditatingMonk.tscn")
onready var WhiteOut = load("res://WhiteOut.tscn")
onready var meditator = Meditator.instance()
var time = 0.0
var started_effect = false
var added_player = false


func _ready():
	var main = get_tree().current_scene
	main.add_child(meditator)
	meditator.global_position  = Vector2(160, 90)

func _process(delta):
	time += delta
	var main = get_tree().current_scene
	if time > 1.0 and not started_effect:
		var MeditationEffect = load("res://MeditatingEffect.tscn")
		var meditationEffect = MeditationEffect.instance()
		main.add_child(meditationEffect)
		meditationEffect.global_position = Vector2(160,90)
		started_effect = true
	if time > 1.9 and not added_player:
		var AstralPlayer = load("res://AstralPlayer.tscn")
		var astralPlayer = AstralPlayer.instance()
		main.add_child(astralPlayer)
		astralPlayer.global_position = Vector2(160,90)
		added_player = true
		
	if time > 25.0:
		Global.karmicPoints = 0
		get_tree().change_scene("res://Sermon.tscn")
	if Global.enlightened:
		var whiteOut = WhiteOut.instance()
		main.add_child(whiteOut)
	if added_player:
		meditator.global_position.y += 1
