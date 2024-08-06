extends GutTest

func test_it_initializes():
	var maze = Maze.new(10, 9)
	
	assert_same(10, maze.rows)
	assert_same(9, maze.cols)

	assert_same(161, len(maze.edges))

