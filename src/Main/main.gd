extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _input(event: InputEvent):
	if event.is_action_pressed("menu"):
		get_tree().change_scene_to_file("res://Menu/menu.tscn")

	if event.is_action_pressed("switch camera"):
		$TopCamera.current = !$TopCamera.current
