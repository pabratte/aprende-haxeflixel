import flixel.FlxSprite;
import flixel.FlxG;
import flixel.math.FlxAngle;
import flixel.util.FlxSpriteUtil;

class Ship extends FlxSprite
{
	public function new(X: Float, Y: Float):Void
	{
    	super(X, Y);
		loadGraphic("assets/images/i_are_spaceship.png", true, 16, 24);
		animation.add("idle", [2], 1, true);
		animation.add("thrust", [0, 1], 10, true);
		animation.play("idle");
	}

	public override function update(elapsed: Float)
	{
    	super.update(elapsed);
	}
}
