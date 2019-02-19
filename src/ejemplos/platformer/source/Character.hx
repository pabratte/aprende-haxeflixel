package;

import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.FlxG;

class Character extends FlxSprite
{
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
	}


	public override function update(elapsed: Float)
	{
		super.update(elapsed);

		if (FlxG.keys.pressed.A)
		{
			velocity.x = -100;
			animation.play("walk");
			flipX = true;
		}
		else if (FlxG.keys.pressed.D)
		{
			velocity.x = 100;
			animation.play("walk");
			flipX = false;
		}
		else
		{
			velocity.x = 0;
			animation.play("idle");
		}

		if(FlxG.keys.justPressed.W && (wasTouching & FlxObject.FLOOR != 0))
		{
			y--;
			velocity.y = -150;
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
	}
}
