package;

import flixel.FlxState;
import flixel.FlxSprite;

class PlayState extends FlxState
{
	var hero: FlxSprite;

	override public function create():Void
	{
		super.create();
		hero = new FlxSprite(100, 100, "assets/images/hero.png");
		hero.velocity.x = 100;
		add(hero);
	}

	override public function update(elapsed:Float):Void
	{
		
	}
}
