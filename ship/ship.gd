extends Node3D

var move = load("res://ship/move.gd").new()
var shoot = load("res://ship/shoot.gd").new()
var game

func _ready():
	game = self.get_parent()

func _process(delta):
	move.move(self, delta)
	shoot.shoot(game, self, delta)

func destroy():
	queue_free()
	
func _on_ship_body_area_entered(area):
	if area.name == 'enemy_body':
		destroy()
		area.get_parent().destroy()
