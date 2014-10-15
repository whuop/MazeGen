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
	y : Int,
	isOpen : Bool
};

class PrimsMaze
{
	private var m_openList : Array<MazeNode>;
	private var m_closedList : Array<MazeNode>;

	private var m_maze : Vector<MazeNode>;
	public var maze(get, never) : Vector<MazeNode>;
	private function get_maze() : Vector<MazeNode> { return m_maze; }

	private var m_options : PrimzMazeOptions;
	public var options(get,set) : PrimzMazeOptions;
	private function get_options() : PrimzMazeOptions { return m_options; }
	private function set_options(v : PrimzMazeOptions) : PrimzMazeOptions { return m_options = v; }

	public function new(options : PrimzMazeOptions) : Void
	{
		m_options = options;
		m_openList = new Array<MazeNode>();
		m_maze = new Vector<MazeNode>(options.width * options.height);

		//	Initialize the whole maze
		for( x in 0...options.width )
		{
			for ( y in 0...options.height )
			{
				m_maze[y * options.width + x] = { up : false, down : false, left : false, right : false, x : x, y : y, isOpen : false};
			}
		}
	}

	public function createMaze() : Void
	{
		//	Get a random position to start the maze at.
		var randomX : Int = Std.random(m_options.width);
		var randomY : Int = Std.random(m_options.height);
		var currNode : MazeNode = m_maze.get(randomY * m_options.width + randomX);
		makeNeighboursOpen(currNode);

		var i : Int = 0;
		//	While there are still nodes to visit
		while ( m_openList.length > 0)
		{
			//	Pick random node
			var randNodeNumber = Std.random(m_openList.length);
			var node = m_openList[randNodeNumber];
			m_openList.remove(node);

			makeNeighboursOpen(node);


			trace( "NodeX: " + node.x + " NodeY: " + node.y + " I: " + i);
			i++;
		}
	}

	private function openWall(nodeA : MazeNode, nodeB : MazeNode) : Void
	{
		if ( nodeA.x < nodeB.x && nodeA.y == nodeB.y )
		{
			nodeA.right = true;
			nodeB.left = true;
		}
		else if (  nodeA.x > nodeB.x && nodeA.y == nodeB.y )
		{
			nodeA.left = true;
			nodeB.right = true;
		}
		else if ( nodeA.y < nodeB.y && nodeA.x == nodeB.x )
		{
			nodeA.down = true;
			nodeB.up = true;
		}
		else if ( nodeA.y > nodeB.y && nodeA.x == nodeB.x )
		{
			nodeA.up = true;
			nodeB.down = true;
		}
	}

	private function makeNeighboursOpen(node : MazeNode) : Void
	{
		var x = node.x;
		var y = node.y;

		//if (node.isOpen)
		//	return;

		x--;
		if ( insideBounds(x , y) )
		{
			var neighbour : MazeNode = m_maze.get( y * m_options.width + x );
			if (!neighbour.isOpen)
			{
				openWall(node , neighbour);
				makeDistinctNeighbourOpen(neighbour);
			}
		}

		x++;
		y--;
		if ( insideBounds(x , y) )
		{
			var neighbour : MazeNode = m_maze.get( y * m_options.width + x );
			if (!neighbour.isOpen)
			{
				openWall(node , neighbour);
				makeDistinctNeighbourOpen(neighbour);
			}
		}

		y++;
		y++;
		if ( insideBounds(x , y) )
		{
			var neighbour : MazeNode = m_maze.get( y * m_options.width + x );
			if (!neighbour.isOpen)
			{
				openWall(node , neighbour);
				makeDistinctNeighbourOpen(neighbour);
			}
		}

		y--;
		x++;
		if ( insideBounds(x , y) )
		{
			var neighbour : MazeNode = m_maze.get( y * m_options.width + x );
			if (!neighbour.isOpen)
			{
				openWall(node , neighbour);
				makeDistinctNeighbourOpen(neighbour);
			}
		}

		//node.isOpen = true;
	}

	private function makeDistinctNeighbourOpen(node : MazeNode) : Void
	{
		m_openList.remove(node);
		m_openList.push(node);
		node.isOpen = true;
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