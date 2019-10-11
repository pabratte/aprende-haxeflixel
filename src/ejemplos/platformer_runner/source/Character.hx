package;

import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.FlxG;

class Character extends FlxSprite
{
	var left: Bool = false;
	var wallDrag: Bool = false;
	
	public function new(X: Float, Y: Float)
	{
		super(X, Y);
		loadGraphic("assets/images/char_sheet.png", true, 16, 16);
		animation.add("idle", [0, 1, 2, 3], 4, true);
		animation.add("walk", [5, 6, 7], 10, true);
		animation.add("jump", [8], 10, true);
		animation.add("fall", [9], 10, true);
		animation.play("idle");
		acceleration.y = 300;

		width = 8; height = 14;
		offset.x = 4; offset.y = 2;
		velocity.x = 100;
	}


	public override function update(elapsed: Float)
	{
		
		super.update(elapsed);

		if(left){
			velocity.x = -100;
		}else{
			velocity.x = 100;
		}
		

		if(FlxG.keys.justPressed.W && (wasTouching & FlxObject.FLOOR != 0))
		{
			y--;
			velocity.y = -150;
		}

		

		trace((wasTouching & FlxObject.RIGHT) != 0);
		trace(velocity.y<0);
		trace("---");
		if((wasTouching & FlxObject.RIGHT) != 0 && velocity.y>0 || (wasTouching & FlxObject.LEFT) != 0 && velocity.y>0){
			wallDrag = true;
		}else{
			wallDrag = false;
		}

		if(wallDrag){
			velocity.y = 50;
		}

		if(FlxG.keys.justPressed.W && wallDrag)
		{
			if(velocity.x>0){
				left = true;
				x++;
			}else{
				left = false;
				x--;
			}
			velocity.y = -150;
			wallDrag = false;
		}
		/*
		if(wasTouching & FlxObject.RIGHT != 0){
			x--;
			velocity.x = -100;
		}

		if(wasTouching & FlxObject.LEFT != 0){
			x++;
			velocity.x = 100;
		}
		*/

		

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
		flipX = left;
	}
}
