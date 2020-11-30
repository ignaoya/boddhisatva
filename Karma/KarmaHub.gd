extends RigidBody2D

const SPEEDUP = 10
const MAXSPEED = 600

func _ready():
	set_physics_process(true)

func create_death_effect():
	var DeathEffect = load("res://Karma/HubEffect.tscn")
	var deathEffect = DeathEffect.instance()
	var main = get_tree().current_scene
	main.add_child(deathEffect)
	deathEffect.global_position = global_position
	Global.karmicPoints += 1
	queue_free()

func _physics_process(delta):
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.get_name() == "Player":
			create_death_effect()
