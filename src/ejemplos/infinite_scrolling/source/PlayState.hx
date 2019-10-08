package;

import flixel.FlxState;
import flixel.FlxSprite;

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
		mid_layer = new FlxSprite(0, 0, "assets/images/sand-repeat.png");
		front_layer = new FlxSprite(0, 0, "assets/images/foregound-merged-repeat.png");

		add(background);
		add(mid_layer);
		add(front_layer);

		background.scrollFactor.set(0, 0);
		mid_layer.scrollFactor.set(0, 0);
		front_layer.scrollFactor.set(0, 0);

		mid_layer.x = -LAYER_ORIG_SIZE;
		front_layer.x = -LAYER_ORIG_SIZE;

		mid_layer.velocity.x = -30;
		front_layer.velocity.x = -100;
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		update_parallax_layers();

	}


	function update_parallax_layers(){
		if(mid_layer.x < -LAYER_ORIG_SIZE){
			mid_layer.x += LAYER_ORIG_SIZE;
		}else if(mid_layer.x > LAYER_ORIG_SIZE){
			mid_layer.x -= LAYER_ORIG_SIZE;
		}
		if(front_layer.x < -LAYER_ORIG_SIZE){
			front_layer.x += LAYER_ORIG_SIZE;
		}else if(front_layer.x > LAYER_ORIG_SIZE){
			front_layer.x -= LAYER_ORIG_SIZE;
		}
	}


	public static inline var LAYER_ORIG_SIZE = 512;	
}
