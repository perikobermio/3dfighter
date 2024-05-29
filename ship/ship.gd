extends Node3D

var move = load("res://ship/move.gd").new()
var shoot = load("res://ship/shoot.gd").new()
var explosion = load("res://resources/explosion.tscn")
var ship

func _ready():
	ship = self.get_parent()

func _process(delta):
	move.move(self, delta)
	shoot.shoot(ship, self, delta)

func destroy():
	ship.get_parent().finish()
	start_explosion()
	
func start_explosion():
	var _explosion = explosion.instantiate()
	_explosion.position = self.global_position
	
	ship.add_child(_explosion)
	
func _on_ship_body_area_entered(area):
	if area.name == 'enemy_body':
		destroy()
		area.get_parent().destroy()


func _on_visible_on_screen_notifier_3d_screen_exited():
	print('screen off')
