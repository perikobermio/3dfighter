extends Node3D

var bullet = load("res://ship/bullet.tscn")
var rechard_time = 0.2
var current_rechard_time = 0.2

func shoot(game, ship, delta):
	if Input.is_action_pressed("ui_space") && canShoot(delta):
		var _bullet = bullet.instantiate()
		_bullet.position = ship.position
		game.add_child(_bullet)
	
func canShoot(delta):
	if current_rechard_time >= rechard_time:
		current_rechard_time = 0.0
		return true
	else:
		current_rechard_time += delta
		return false
			
