extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _input(event):
	if event.is_action_pressed("menu"):
		get_tree().change_scene_to_file("res://Main/main.tscn")


func _on_exit_button_button_down():
	get_tree().quit()


func _on_back_button_button_down():
	get_tree().change_scene_to_file("res://Main/main.tscn")
