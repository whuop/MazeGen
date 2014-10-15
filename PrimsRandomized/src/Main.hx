import luxe.Input;
import primsrandomized.PrimsMaze;
import renderers.MazeRenderer;

class Main extends luxe.Game 
{
    override function ready() 
    {
        var prims = new PrimsMaze( { width : 10, height : 10 } );
        prims.createMaze();

        MazeRenderer.CreateGeometry(prims);
    } //ready

    override function onkeyup( e:KeyEvent ) 
    {
        if(e.keycode == Key.escape) 
        {
            Luxe.shutdown();
        }

    } //onkeyup

    override function update(dt:Float) 
    {	

    } //update

} //Main
