extends Node3D

func _ready():
	$sprite.play("explosion1")

func _process(delta):
	pass

func _on_sprite_animation_finished():
	queue_free()
