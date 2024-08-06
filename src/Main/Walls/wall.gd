extends AnimatableBody3D

@export var max_height = 0
@export var min_height = -20
@export var step = 1

var go_up = true


func _physics_process(delta):
	if go_up && position.y < max_height:
		position.y += step * delta
	if !go_up && position.y > min_height:
		position.y -= step * delta
