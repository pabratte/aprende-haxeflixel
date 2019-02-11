package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxTimer;

class Enemy extends FlxSprite
{
	public function new(X: Float, Y: Float)
	{
		super(X, Y);
        loadGraphic("assets/images/0x72_DungeonTilesetII_v1.2.png", true, 16, 32);
        animation.add("run", [345, 346, 347, 348, 349], 10);
        animation.play("run");
        
        // adjust AABB
        height = 16;
        width = 12;
        offset.set(2, 16);

        var timer = new FlxTimer();
        onRestartTimer(timer);
    }

    public override function update(elapsed: Float){
        super.update(elapsed);
        
    }

    
    private function onTimerOff(theTimer: FlxTimer)
    {
        switch(FlxG.random.int(0, 3)){
            case 0:
                velocity.y = ENEMY_VEL;
                velocity.x = 0;
            case 1:
                velocity.y = -ENEMY_VEL;
                velocity.x = 0;
            case 2:
                velocity.y = 0;
                velocity.x = ENEMY_VEL;
            case 3:
                velocity.y = 0;
                velocity.x = -ENEMY_VEL;
        }
        theTimer.start(FlxG.random.int(1, 3), onRestartTimer);
    }

    private function onRestartTimer(theTimer: FlxTimer)
    {
        velocity.x = velocity.y = 0;
        theTimer.start(FlxG.random.int(0, 2), onTimerOff);
    }

    static inline var ENEMY_VEL: Float = 80;
}