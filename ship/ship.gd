extends Node3D

var move = load("res://ship/move.gd").new()
var shoot = load("res://ship/shoot.gd").new()
var game

func _ready():
	game = self.get_parent()

func _process(delta):
	move.move(self, delta)
	shoot.shoot(game, self, delta)
