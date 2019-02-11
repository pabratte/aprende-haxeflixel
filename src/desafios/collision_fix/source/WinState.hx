package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;

class WinState extends FlxState
{
	override public function create():Void
	{
		super.create();
        var text = new FlxText(0, 64, FlxG.width);
        text.size = 16;
        text.alignment = "center";        
        text.text = "Lo lograste!!!\n\nEl druida ha conseguido las pociones y escapado del calabozo.";
        add(text);
    }
}