class_name Maze

var s = 5
var offset = 2.3

var rows: int
var cols: int

var cells_map = {}
var edges = []

func _init(r: int, c: int):
	rows = r
	cols = c
	
	for i in range(rows):
		cells_map[i] = {}
		for j in range(cols):
			var cell = Cell.new(i * s - offset * rows, j * s - offset * cols)
			cells_map[i][j] = cell
			
			if i > 0:
				var north = cells_map[i - 1][j]
				edges.append(Edge.new(cell, north))
			if j > 0:
				var west = cells_map[i][j - 1]
				edges.append(Edge.new(cell, west))

func rando():
	for edge in edges:
		if randf() < 0.5:
			edge.wall.go_up = !edge.wall.go_up
