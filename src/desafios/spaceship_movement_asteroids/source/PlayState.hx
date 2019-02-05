package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;



class PlayState extends FlxState
{
	private var ship: FlxSprite;

	override public function create():Void
	{
		super.create();
		var background = new FlxSprite(0, 0, "assets/images/back.png");
		ship = new Ship(Std.int(FlxG.width/2), Std.int(FlxG.height/2));
		var text = new FlxText(0, 0, 600, "Utilice las flechas o teclas WASD para mover la nave");
		add(background);
		add(ship);
		add(text);
	}
}
