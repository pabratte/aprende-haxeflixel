package;

import flixel.FlxSprite;
import flixel.FlxG;

class Hero extends FlxSprite
{
	public function new(X: Float, Y: Float)
	{
		super(X, Y);
        loadGraphic("assets/images/0x72_DungeonTilesetII_v1.2.png", true, 16, 32);
        animation.add("idle", [136, 137], 3);
        animation.add("run", [138, 139, 140, 141, 142], 10);
        animation.play("idle");
        
        // adjust AABB
        height = 16;
        width = 12;
        offset.set(2, 16);
    }

    public override function update(elapsed: Float){
        super.update(elapsed);
        if(FlxG.keys.pressed.A){
            velocity.x = -HERO_VEL;
            flipX = true;
        }else if(FlxG.keys.pressed.D){
            velocity.x = HERO_VEL;
            flipX = false;
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

        if(velocity.x != 0 || velocity.y != 0){
            animation.play("run");
        }else{
            animation.play("idle");
        }
    }

    static inline var HERO_VEL: Float = 60;
}