import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxTimer;

class Enemy extends FlxSprite
{
  private var walking_front: Bool = true;

  public function new (X: Float = 0, Y: Float = 0)
  {
    super(X, Y);
    loadGraphic("assets/images/sprites_alpha.png", true, 16, 16);
    animation.add("idle", [32], 1);
    animation.add("moving", [32, 33], 5);
    animation.play("idle");
    width = 14;
    offset.x = 1;
    height = 14;
    offset.y = 1;
    x += offset.x;
    y += offset.y;
    var timer = new FlxTimer();
    onRestartTimer(timer);
  }

  public override function update(elapsed: Float):Void
  {
    super.update(elapsed);
  }

  private function onTimerOff(theTimer: FlxTimer)
  {
    switch(FlxG.random.int(0, 3)){
      case 0:
        velocity.y = ENEMY_VEL;
        velocity.x = 0;
        angle = 0;

      case 1:
        velocity.y = -ENEMY_VEL;
        velocity.x = 0;
        angle = 180;

      case 2:
        velocity.y = 0;
        velocity.x = ENEMY_VEL;
        angle = -90;

      case 3:
        velocity.y = 0;
        velocity.x = -ENEMY_VEL;
        angle = 90;
    }
    animation.play("moving");
    theTimer.start(3, onRestartTimer);
  }

  private function onRestartTimer(theTimer: FlxTimer)
  {
    velocity.x = velocity.y = 0;
    animation.play("idle");
    theTimer.start(1, onTimerOff);
  }

  private static inline var ENEMY_VEL: Float = 16;
}
