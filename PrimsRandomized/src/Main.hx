import luxe.Input;
import primsrandomized.PrimsMaze;

class Main extends luxe.Game 
{
    override function ready() 
    {
        var prims = new PrimsMaze( { width : 10, height : 10 } );
        prims.createMaze();
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
