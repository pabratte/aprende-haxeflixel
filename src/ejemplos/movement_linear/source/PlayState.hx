package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;

class PlayState extends FlxState
{
	var hero: FlxSprite;

	override public function create():Void
	{
		super.create();
		hero = new FlxSprite(300, 300, "assets/images/hero.png");
		add(hero);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if(FlxG.keys.pressed.A){
			hero.velocity.x = -200;
		}else if(FlxG.keys.pressed.D){
			hero.velocity.x = 200;
		}else{
			hero.velocity.x = 0;
		}
	}
}
