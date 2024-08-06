class_name Cell

static var ID = 0;

var id
var neighboors = {}

var x: int
var y: int

func _init(x_: int, y_: int):
	ID += 1
	id = ID
	
	x = x_
	y = y_
