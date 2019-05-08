package;

import flixel.FlxSprite;
import flixel.FlxG;

class Asteroid extends FlxSprite
{
	public function new() {
	    super(0, 0, "assets/images/asteroid-brown.png");
        init();
	}

    public override function update(elapsed: Float){
        super.update(elapsed);
        if(y > FlxG.height + height){
            init();
        }
    }

    private function init(){
        y =  FlxG.random.int(-FlxG.width * 2, Std.int(-width));
        x = FlxG.random.int(0, Std.int(FlxG.width-width));
        velocity.y = FlxG.random.float(50, 200);
        angularVelocity = FlxG.random.float(90, 180);
    }
}
