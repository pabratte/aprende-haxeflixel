package;

import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.FlxG;

class Character extends FlxSprite
{	
	public static inline var JUMP_VEL = 300;
	public static inline var MOV_VEL = 150;
	public static inline var GRAVITY = 700;

	public function new(X: Float, Y: Float)
	{
		super(X, Y);
		loadGraphic("assets/images/char_sheet.png", true, 16, 16);
		animation.add("idle", [0, 1, 2, 3], 4, true);
		animation.add("walk", [5, 6, 7], 10, true);
		animation.add("jump", [8], 10, true);
		animation.add("fall", [9], 10, true);
		animation.play("idle");
		acceleration.y = GRAVITY;

		width = 8; height = 14;
		offset.x = 4; offset.y = 2;
		velocity.x = 100;
	}


	public override function update(elapsed: Float)
	{
		
		super.update(elapsed);
		

		if(FlxG.keys.justPressed.W && (wasTouching & FlxObject.FLOOR != 0))
		{
			y--;
			velocity.y = -JUMP_VEL;
		}
		
		if(wasTouching & FlxObject.RIGHT != 0){
			x--;
			velocity.x = -MOV_VEL;
		}

		if(wasTouching & FlxObject.LEFT != 0){
			x++;
			velocity.x = MOV_VEL;
		}
		

		

		if(wasTouching & FlxObject.FLOOR == 0)
		{
			if(velocity.y > 0)
			{
				animation.play("fall");
			}
			else
			{
				animation.play("jump");
			}
		}
		flipX = velocity.x<0;
	}

	public function animateDeath(){
		allowCollisions = FlxObject.NONE;
		velocity.y = -JUMP_VEL;
		velocity.x = velocity.x/5;
		angularVelocity = 200;
	}
}
