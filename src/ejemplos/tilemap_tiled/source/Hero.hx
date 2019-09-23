import flixel.FlxSprite;
import flixel.FlxG;
import flixel.effects.FlxFlicker;

class Hero extends FlxSprite
{
  private var walking_front: Bool = true;

  public function new (X: Float = 0, Y: Float = 0)
  {
    super(X, Y);
    loadGraphic("assets/images/sprites_alpha.png", true, 16, 16);
    animation.add("standing_front", [96], 1);
    animation.add("standing_back", [112], 1);
    animation.add("walking_front", [97, 98, 99], 5);
    animation.add("walking_back", [113, 114, 115], 5);
    animation.play("standing_front");
    width = 12;
    offset.x = 2;
    x += offset.x;
  }

  override public function update(elapsed:Float):Void
  {
    super.update(elapsed);
    if(FlxG.keys.pressed.A || FlxG.keys.pressed.LEFT){
      animation.play("walking_front");
      velocity.x = -HERO_VEL;
      walking_front = true;
    }else if(FlxG.keys.pressed.D || FlxG.keys.pressed.RIGHT){
      animation.play("walking_front");
      velocity.x = HERO_VEL;
      walking_front = true;
    }else{
      velocity.x = 0;
    }

    if(FlxG.keys.pressed.W || FlxG.keys.pressed.UP){
      animation.play("walking_back");
      velocity.y = -HERO_VEL;
      walking_front = false;
    }else if(FlxG.keys.pressed.S || FlxG.keys.pressed.DOWN){
      animation.play("walking_front");
      velocity.y = HERO_VEL;
      walking_front = true;
    }else{
      velocity.y = 0;
    }

    if(Math.abs(velocity.x) < 0 && Math.abs(velocity.y) < 0){
      if(walking_front)
        animation.play("standing_front");
      else
        animation.play("standing_back");
    }
  }

  public function hit(){
    if(FlxFlicker.isFlickering(this)) return;
    FlxFlicker.flicker(this);
  }

  private inline static var HERO_VEL: Float     = 50;
}
