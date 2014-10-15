package renderers;
import primsrandomized.PrimsMaze;
import luxe.Vector;
import luxe.Color;

class MazeRenderer
{
	private function new() : Void
	{

	}

	public static function CreateGeometry(maze : PrimsMaze) : Void
	{
		var origin : Vector = new Vector(Luxe.screen.w / 2, Luxe.screen.h / 2);
		var gridSize : Int = 32;

		for( x in 0...maze.options.width )
		{
			for(y in 0...maze.options.height )
			{
				var currentNode : MazeNode = maze.maze.get( y * maze.options.width + x );
				trace("Current Node: " + currentNode);

				Luxe.draw.rectangle({
				    x : origin.x + currentNode.x * gridSize - gridSize / 8, 
				    y : origin.y + currentNode.y * gridSize - gridSize / 8,
				    w : gridSize / 4, 
				    h : gridSize / 4,
				    color : new Color( 0.4, 0.4, 0.4 )
				});

				if (currentNode.up)
				{
					Luxe.draw.line({
					    p0 : new Vector( origin.x + currentNode.x * gridSize, origin.y + currentNode.y * gridSize ),
					    p1 : new Vector( origin.x + currentNode.x * gridSize, origin.y + currentNode.y * gridSize - gridSize ),
					    color : new Color( 0.5, 0.2, 0.2, 1 )
					});
				}
				if (currentNode.right)
				{
					Luxe.draw.line({
					    p0 : new Vector( origin.x + currentNode.x * gridSize, origin.y + currentNode.y * gridSize ),
					    p1 : new Vector( origin.x + currentNode.x * gridSize + gridSize, origin.y + currentNode.y * gridSize ),
					    color : new Color( 0.5, 0.2, 0.2, 1 )
					});
				}
				if (currentNode.down)
				{
					Luxe.draw.line({
					    p0 : new Vector( origin.x + currentNode.x * gridSize, origin.y + currentNode.y * gridSize ),
					    p1 : new Vector( origin.x + currentNode.x * gridSize, origin.y + currentNode.y * gridSize + gridSize ),
					    color : new Color( 0.5, 0.2, 0.2, 1 )
					});
				}
				if (currentNode.left)
				{
					Luxe.draw.line({
					    p0 : new Vector( origin.x + currentNode.x * gridSize, origin.y + currentNode.y * gridSize ),
					    p1 : new Vector( origin.x + currentNode.x * gridSize - gridSize, origin.y + currentNode.y * gridSize ),
					    color : new Color( 0.5, 0.2, 0.2, 1 )
					});
				}
			}
		}
	}
}