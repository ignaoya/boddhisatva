extends Node2D

func _process(delta):
	if Input.is_action_just_pressed("ui_accept"):
		Global.enlightened = false
		get_tree().change_scene("res://TitleScreen.tscn")
