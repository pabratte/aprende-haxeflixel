package;

import flixel.FlxState;
import flixel.FlxSprite;

class PlayState extends FlxState
{
	var spApple: FlxSprite;

	override public function create():Void
	{
		super.create();
		spApple = new FlxSprite(100, 100, "assets/images/hero.png");
		add(spApple);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
