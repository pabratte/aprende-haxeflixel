import flixel.FlxSprite;
import flixel.FlxG;

class Coin extends FlxSprite
{
  public function new (X: Float = 0, Y: Float = 0)
  {
    super(X, Y);
    loadGraphic("assets/images/sCoins.png", true, 16, 16);
    animation.add("idle", [0, 1, 2, 3], 3);
    animation.play("idle");
    width = 6;
    offset.x = 5;
    height = 8;
    offset.y = 8;
    x += offset.x;
    y += 4;
  }

  public function pick():Void
  {
      kill();
  }
}
