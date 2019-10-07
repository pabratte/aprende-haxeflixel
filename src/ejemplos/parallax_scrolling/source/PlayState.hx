package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.util.FlxSpriteUtil;
import flixel.FlxG;

class PlayState extends FlxState
{
	var background: FlxSprite;
	var mid_layer: FlxSprite;
	var front_layer: FlxSprite;
	var seahorse: FlxSprite;


	override public function create():Void
	{
		super.create();
		background = new FlxSprite(0, 0, "assets/images/far.png");
		mid_layer = new FlxSprite(0, 0, "assets/images/sand.png");
		front_layer = new FlxSprite(0, 0, "assets/images/foregound-merged.png");

		add(background);
		add(mid_layer);
		add(front_layer);

		background.scrollFactor.set(0, 0);
		mid_layer.scrollFactor.set(0.2, 0);

		create_seahorse();
		

		FlxG.camera.follow(seahorse);
		FlxG.camera.setScrollBoundsRect(0, 0, 512, 192, true);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		update_seahorse();

	}


	function create_seahorse(){
		seahorse = new FlxSprite(192, 96);
		seahorse.loadGraphic("assets/images/seahorse-hippocampus-kuda-Sheet.png", true, 32, 32);
		seahorse.animation.add("idle", [0, 1], 3);
		seahorse.animation.play("idle");
		seahorse.width = 16;
		seahorse.offset.x = 8;
		add(seahorse);
	}

	function update_seahorse(){
		FlxSpriteUtil.bound(seahorse, 0, 512, 0, 192);
		if(FlxG.keys.pressed.A){
			seahorse.velocity.x = -100;
			seahorse.flipX = true;
		}else if(FlxG.keys.pressed.D){
			seahorse.velocity.x = 100;
			seahorse.flipX = false;
		}else{
			seahorse.velocity.x = 0;
		}

		if(FlxG.keys.pressed.W){
			seahorse.velocity.y = -100;
		}else if(FlxG.keys.pressed.S){
			seahorse.velocity.y = 100;
		}else{
			seahorse.velocity.y = 0;
		}
	}
}
