extends RigidBody2D

var speed
func _ready():
	set_physics_process(true)
	set_process(true)

func create_death_effect():
	var DeathEffect = load("res://Karma/CasinoEffect.tscn")
	var deathEffect = DeathEffect.instance()
	var main = get_tree().current_scene
	main.add_child(deathEffect)
	deathEffect.global_position = global_position
	Global.karmicPoints += 1
	queue_free()

func _physics_process(delta):
	var bodies = get_colliding_bodies()
	
	for body in bodies:
		if body.get_name() == "AstralPlayer":
			create_death_effect()
			

func _process(delta):
	if Global.karmicPoints > 0:
		speed = 15 / Global.karmicPoints
	else:
		speed = 15
	linear_velocity.y = 20 * speed
	if position.y > 180:
		queue_free()
