extends Node3D

var speed = 10

func _process(delta):
	position.z -= speed * delta

func _on_visible_on_screen_notifier_3d_screen_exited():
	queue_free()
