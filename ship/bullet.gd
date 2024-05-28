extends Node3D

var speed = 1.4

func _process(delta):
	position.z += speed 

func _on_visible_on_screen_notifier_3d_screen_exited():
	destroy()

func destroy():
	queue_free()
