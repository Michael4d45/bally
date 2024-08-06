extends Node3D

@export var s = 10

var maze = Maze.new(10, 10)

# Called when the node enters the scene tree for the first time.
func _ready():
	maze.rando()
	for edge in maze.edges:
		add_child(edge.wall)

	$Timer.connect("timeout", maze.rando)
