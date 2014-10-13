package primsrandomized;
import haxe.ds.Vector;

typedef PrimzMazeOptions = 
{
	width : Int,
	height : Int
};

typedef MazeNode = 
{
	up : Bool,
	down : Bool,
	left : Bool,
	right : Bool
};

class PrimsMaze
{
	private var m_openList : Array<MazeNode>;

	private var m_maze : Vector<MazeNode>;

	private var m_options : PrimzMazeOptions;

	public function new(options : PrimzMazeOptions)
	{
		m_options = options;
		m_openList = new Array<MazeNode>();
		m_maze = new Vector<MazeNode>(options.width * options.height);

		for( i in 0...m_openList.length )
		{
			m_maze[i] = { up : false, down : false, left : false, right : false};
		}
	}

	public function createMaze()
	{
		//	Get a random position to start the maze at.
		var randomX : Int = Std.random(m_options.width);
		var randomY : Int = Std.random(m_options.height);
		makeNeighborsOpen(randomX, randomY);


		//	While there are still nodes to visit
		while ( m_openList.length > 0)
		{

		}
	}

	private function makeNeighborsOpen(x : Int, y : Int)
	{

	}
}