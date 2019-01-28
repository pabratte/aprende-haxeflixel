package;

import flixel.FlxState;
import flixel.FlxSprite;

class PlayState extends FlxState
{
	var background: FlxSprite;
	var door: 		FlxSprite;
	var bee: 		FlxSprite;
	var key: 		FlxSprite;
	var block1: 	FlxSprite;
	var block2: 	FlxSprite;
	var itemBlock: 	FlxSprite;
	var coin1: 		FlxSprite;
	var coin2: 		FlxSprite;
	var char1: 		FlxSprite;
	var char2: 		FlxSprite;

	override public function create():Void
	{
		super.create();
		background = new FlxSprite(0, 0, AssetPaths.background__png);

		coin1 	= new FlxSprite(2*21, 6*21, AssetPaths.coin__png);
		coin2 	= new FlxSprite(3*21, 5*21, AssetPaths.coin__png);
		door 	= new FlxSprite();
		key 	= new FlxSprite();
		block1 	= new FlxSprite();
		block2 	= new FlxSprite();
		char1	= new FlxSprite(7*21, 5*21, AssetPaths.char1__png);
		char2	= new FlxSprite(12*21, 5*21, AssetPaths.char1__png);
		char2.flipX = true;
		add(background);
		add(coin1);
		add(coin2);
		add(char1);
		add(char2);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
