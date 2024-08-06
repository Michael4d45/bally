class_name Edge

var Wall = preload("res://Main/Walls/wall.tscn")

var cell1: Cell
var cell2: Cell

var wall

func _init(c1: Cell, c2: Cell):
	cell1 = c1
	cell2 = c2

	wall = Wall.instantiate()
	var cell_position = Vector3(cell1.x, 0, cell1.y)
	wall.look_at_from_position(get_position(), cell_position)

func get_position():
	var x1 = cell1.x
	var y1 = cell1.y
	var x2 = cell2.x
	var y2 = cell2.y
	
	var x = float(x1 + x2) / 2
	var y = float(y1 + y2) / 2
	
	return Vector3(x, 0, y)

func activate():
	wall.go_up = true
	
func deactivate():
	wall.go_up = false
