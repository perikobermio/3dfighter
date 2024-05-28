extends Node3D

var enemy = load("res://enemies/enemy1.tscn")
var canPlay = false

func _ready():
	pass
	
func _process(delta):
	if canPlay && Input.is_action_pressed("ui_control"):
		var _enemy = enemy.instantiate()
		_enemy.position = Vector3(randf_range(-45, 45), 0, 70)
		add_child(_enemy)

func finish():
	$ship.hide()
	#$ship.global_position.x = 0
	#$ship.global_position.z = 0
	$hud.show_game_over()

func _on_hud_start_game():
	$ship.show()
	canPlay = true
