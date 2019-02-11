package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxTimer;

class Flask extends FlxSprite
{
	public function new(X: Float, Y: Float, Color: Int = 0)
	{
		super(X, Y);
        loadGraphic("assets/images/0x72_DungeonTilesetII_v1.2.png", true, 16, 16);
		animation.frameIndex = 466 + Color;
    }
}