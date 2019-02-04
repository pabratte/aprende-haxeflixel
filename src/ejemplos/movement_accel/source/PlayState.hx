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
		hero.drag.x = 100;
		hero.maxVelocity.x = 200;
		add(hero);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if(FlxG.keys.pressed.A){
			hero.acceleration.x = -200;
		}else if(FlxG.keys.pressed.D){
			hero.acceleration.x = 200;
		}else{
			hero.acceleration.x = 0;
		}
	}
}
