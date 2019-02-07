package;

import flixel.FlxSprite;
import flixel.FlxG;

class Enemy extends FlxSprite
{
	public function new(X: Float, Y: Float)
	{
		super(X, Y);
        loadGraphic("assets/images/0x72_DungeonTilesetII_v1.2.png", true, 16, 32);
        animation.add("idle", [343, 344], 2);
        animation.add("run", [345, 346, 347, 348, 349], 8);
        animation.play("idle");
        
        // adjust AABB
        height = 16;
        width = 12;
        offset.set(2, 16);
    }

    public override function update(elapsed: Float){
        super.update(elapsed);
        if()
    }

    function move(){
        
    }

    static inline var ENEMY_VEL: Float = 50;
}