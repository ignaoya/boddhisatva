extends Node2D

var time = 0.0

func _process(delta):
	time += delta
	if time > 2.0:
		get_tree().change_scene("res://Meditation.tscn")
