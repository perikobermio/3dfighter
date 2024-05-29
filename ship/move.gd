extends Node3D

var max_speed = 140
var velocity = Vector3.ZERO
var acceleration = 1100.0
var deceleration = 1500.0
var current_rotation = 0.0
var max_rotation = 0.8
var speed_rotation = 0.07
#var screen_limits = Vector3(48, 0, 62)
var screen_limits = Vector3(90, 0, 120)

func move(ship, delta):
	var input_dir = Vector3.ZERO

	if Input.is_action_pressed("ui_left"):
		input_dir.x += 1
		current_rotation -= speed_rotation
		
	if Input.is_action_pressed("ui_right"):
		input_dir.x -= 1
		current_rotation += speed_rotation
		
	if Input.is_action_pressed("ui_up"): 	
		input_dir.z += 1
	if Input.is_action_pressed("ui_down"):
		input_dir.z -= 1

	# Update velocity
	if input_dir != Vector3.ZERO:
		velocity = velocity.move_toward(input_dir * max_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector3.ZERO, deceleration * delta)

	if !Input.is_action_pressed("ui_left") && !Input.is_action_pressed("ui_right"):
		if current_rotation > 0: current_rotation -= speed_rotation
		if current_rotation < 0: current_rotation += speed_rotation
	if current_rotation > max_rotation: current_rotation = max_rotation
	if current_rotation < -max_rotation: current_rotation = -max_rotation
	
	ship.rotation.z = current_rotation
	ship.position += velocity * delta
	
	if ship.position.x > screen_limits.x: ship.position.x = screen_limits.x
	if ship.position.x < -screen_limits.x: ship.position.x = -screen_limits.x
	if ship.position.z > screen_limits.z: ship.position.z = screen_limits.z
	if ship.position.z < -screen_limits.z: ship.position.z = -screen_limits.z
