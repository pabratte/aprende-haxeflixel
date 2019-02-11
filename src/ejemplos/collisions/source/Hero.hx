import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;


class Hero extends FlxSprite{
    public function new(X: Float, Y: Float)
    {
        super(X, Y);
        makeGraphic(16, 16, FlxColor.RED);
    }

    public override function update(elapsed: Float)
    {
        super.update(elapsed);
        if(FlxG.keys.pressed.A){
            velocity.x = -HERO_VEL;
        }else if(FlxG.keys.pressed.D){
            velocity.x = HERO_VEL;
        }else{
            velocity.x = 0;
        }

        if(FlxG.keys.pressed.W){
            velocity.y = -HERO_VEL;
        }else if(FlxG.keys.pressed.S){
            velocity.y = HERO_VEL;
        }else{
            velocity.y = 0;
        }
    }

    static inline var HERO_VEL: Float = 100;
}