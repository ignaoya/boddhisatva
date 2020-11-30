extends Node2D

	
func _process(delta):
	#get_node("AudioStreamPlayer").play()
	if Input.is_action_just_pressed("ui_accept"):
		get_tree().change_scene("res://Intro.tscn")
