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
	right : Bool,
	x : Int,
	y : Int
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


		for( x in 0...options.width )
		{
			for ( y in 0...options.height )
			{
				m_maze[y * options.width + x] = { up : false, down : false, left : false, right : false, x : x, y : y};
			}
		}
	}

	public function createMaze() : Void
	{
		//	Get a random position to start the maze at.
		var randomX : Int = Std.random(m_options.width);
		var randomY : Int = Std.random(m_options.height);
		makeNeighboursOpen(randomX, randomY);

		var i : Int = 0;
		//	While there are still nodes to visit
		while ( m_openList.length > 0)
		{
			//	Pick random node
			var node = m_openList.remove(m_openList[Std.random(m_openList.length)]);


			trace("I: " + i);
			i++;
		}
	}

	private function openWall(ax : Int, ay : Int, bx : Int, by : Int) : Void
	{

	}

	private function makeNeighboursOpen(x : Int, y : Int) : Void
	{
		x--;
		if ( insideBounds(x , y) )
			makeDistinctNeighbourOpen(x , y);

		x++;
		y--;
		if ( insideBounds(x , y) )
			makeDistinctNeighbourOpen(x , y);

		y++;
		y++;
		if ( insideBounds(x , y) )
			makeDistinctNeighbourOpen(x , y);

		y--;
		x++;
		if ( insideBounds(x , y) )
			makeDistinctNeighbourOpen(x , y);
	}

	private function makeDistinctNeighbourOpen(x : Int, y : Int) : Void
	{
		m_openList.remove(m_maze[y * m_options.width + x]);
		m_openList.push(m_maze[y * m_options.width + x]);
	}

	private function insideBounds(x : Int, y : Int) : Bool
	{
		if ( x < 0 || x >= m_options.width)
			return false;
		else if ( y < 0 || y >= m_options.height )
			return false;

		return true;
	}
}