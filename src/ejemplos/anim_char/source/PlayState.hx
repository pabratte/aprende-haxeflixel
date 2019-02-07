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
		hero = new FlxSprite(152, 112);
		hero.loadGraphic(AssetPaths.character_base__png, true, 16, 16);
		hero.animation.add("idle", [0, 1, 2, 3], 2);
		hero.animation.add("run-left", [20, 21, 22, 23], 5);
		hero.animation.play("idle");
		add(hero);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		// movement
		if(FlxG.keys.pressed.A){
			hero.velocity.x = -HERO_VEL;
		}else{
			hero.velocity.x = 0;
		}

		// animation
		if(hero.velocity.x != 0){
			hero.animation.play("run-left");
		}else{
			hero.animation.play("idle");
		}
	}

	static inline var HERO_VEL: Float = 60;
}
