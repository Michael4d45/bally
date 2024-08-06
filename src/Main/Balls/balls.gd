extends Node3D

var Ball = preload("res://Main/Balls/ball.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.connect("timeout", _on_Timer_timeout)


func _on_Timer_timeout():
	var ball = Ball.instantiate()
	
	ball.linear_velocity .y += 50
	
	ball.linear_velocity .x += randf() * 4 - 2
	ball.linear_velocity .z += randf() * 4 - 2
	
	add_child(ball)
