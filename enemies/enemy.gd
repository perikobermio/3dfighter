extends Node3D

var speed = 10
var explosion = load("res://enemies/explosion.tscn")

func _process(delta):
	position.z -= speed * delta

func _on_visible_on_screen_notifier_3d_screen_exited():
	destroy()

func destroy():
	start_explosion()
	queue_free()

func start_explosion():
	var _explosion = explosion.instantiate()
	_explosion.position = self.global_position
	
	get_tree().root.add_child(_explosion)
	
func _on_area_3d_area_entered(area):
	if area.name == 'bullet_body':
		destroy()
		area.get_parent().destroy()
