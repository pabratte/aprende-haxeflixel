package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	var hero: FlxSprite;

	override public function create():Void
	{
		super.create();
		bgColor = FlxColor.WHITE;
		hero = new FlxSprite(152, 112);
		hero.loadGraphic(AssetPaths.character_base__png, true, 16, 16);
		hero.animation.add("idle-down", [0, 1, 2, 3], 3);
		hero.animation.add("run-down", [4, 5, 6, 7], 5);
		hero.animation.add("idle-up", [8, 9, 10, 11], 3);
		hero.animation.add("run-up", [12, 13, 14, 15], 5);
		hero.animation.add("idle-side", [16, 17, 18, 19], 3);
		hero.animation.add("run-side", [20, 21, 22, 23], 5);
		hero.animation.play("idle-down");
		add(hero);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		// TODO: movement

		// TODO: animation
		
	}

	static inline var HERO_VEL_HORIZONTAL: Float = 60;
	static inline var HERO_VEL_VERTICAL: Float = HERO_VEL_HORIZONTAL*0.8;
}
