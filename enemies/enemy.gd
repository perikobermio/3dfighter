extends Node3D

var speed = 10

func _process(delta):
	position.z -= speed * delta

func _on_visible_on_screen_notifier_3d_screen_exited():
	destroy()

func destroy():
	queue_free()

func _on_area_3d_area_entered(area):
	if area.name == 'bullet_body':
		destroy()
		area.get_parent().destroy()
