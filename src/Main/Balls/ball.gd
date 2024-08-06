extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.connect("timeout", die)


func die():
	get_tree().queue_delete(self)
