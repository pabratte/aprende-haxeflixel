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
		hero = new FlxSprite(152, 196);
		hero.loadGraphic(AssetPaths.char_sheet__png, true, 16, 16);
		hero.animation.add("idle", [0, 1, 2, 3], 4, true);
		hero.animation.add("run", [5, 6, 5, 7], 8, true);
		hero.animation.play("idle");
		add(hero);
		
	}

	public override function update(elapsed: Float):Void
	{
		super.update(elapsed);
		// movement
		if (FlxG.keys.pressed.A || FlxG.keys.pressed.LEFT)
		{
			hero.velocity.x = -HERO_VEL;
			hero.flipX = true;
		}
		else if (FlxG.keys.pressed.D || FlxG.keys.pressed.RIGHT)
		{
			hero.velocity.x = HERO_VEL;
			hero.flipX = false;
		}
		else
		{
			hero.velocity.x = 0;
		}

		// animation
		if(hero.velocity.x != 0){
			hero.animation.play("run");
		}else{
			hero.animation.play("idle");
		}
	}

	private static inline var HERO_VEL: Float = 100;
}
