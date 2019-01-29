package;

import flixel.FlxState;
import flixel.FlxSprite;

class PlayState extends FlxState
{
	var block1: 	FlxSprite;
	var coin1: 		FlxSprite;

	override public function create():Void
	{
		super.create();
	
		coin1 	= new FlxSprite(2*BLOCK_SIZE, 6*BLOCK_SIZE, AssetPaths.coin__png);
		block1 	= new FlxSprite(8*BLOCK_SIZE, 4*BLOCK_SIZE, AssetPaths.block_brick__png);

		add(coin1);
		add(block1);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	static inline var BLOCK_SIZE: Int = 21;
}
