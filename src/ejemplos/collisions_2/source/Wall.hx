import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;


class Wall extends FlxSprite{
    public function new(X: Float, Y: Float, W: Int, H: Int)
    {
        super(X, Y);
        makeGraphic(W, H, FlxColor.GRAY);
        immovable = true;
    }
}