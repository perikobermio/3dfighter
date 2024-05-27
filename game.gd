extends Node3D

var enemy = load("res://enemies/enemy1.tscn")

func _ready():
	pass
	
func _process(delta):
	if Input.is_action_pressed("ui_control"):
		var _enemy = enemy.instantiate()
		_enemy.position = Vector3(randf_range(-45, 45), 0, 70)
		add_child(_enemy)
