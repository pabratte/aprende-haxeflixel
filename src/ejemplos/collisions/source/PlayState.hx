package;

import flixel.FlxState;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.util.FlxColor;
import flixel.FlxG;

class PlayState extends FlxState
{
	var hero: Hero;
	var objects: FlxGroup;
	override public function create():Void
	{
		super.create();
		hero = new Hero(100, 100);
		objects = new FlxGroup();
		
		add(hero);
		add(objects);
		create_walls();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(hero, objects);
	}

	function create_walls(){
		/// walls
		var wallUp = new FlxSprite(16, 0);
		wallUp.makeGraphic(FlxG.width-32, 16, FlxColor.BLUE);
		wallUp.immovable = true;
		objects.add(wallUp);

		var wallDown = new FlxSprite(16, FlxG.height-16);
		wallDown.makeGraphic(FlxG.width-32, 16, FlxColor.BLUE);
		wallDown.immovable = true;
		objects.add(wallDown);

		var wallLeft = new FlxSprite(0, 16);
		wallLeft.makeGraphic(16, FlxG.height-32, FlxColor.BLUE);
		wallLeft.immovable = true;
		objects.add(wallLeft);

		var wallRight = new FlxSprite(FlxG.width-16, 16);
		wallRight.makeGraphic(16, FlxG.height-32, FlxColor.BLUE);
		wallRight.immovable = true;
		objects.add(wallRight);

		var wallMiddle = new FlxSprite(228, 64);
		wallMiddle.makeGraphic(16, 112, FlxColor.BLUE);
		wallMiddle.immovable = true;
		objects.add(wallMiddle);

		// pushable box
		var box = new FlxSprite(128, 128);
		box.makeGraphic(16, 16, FlxColor.GREEN);
		objects.add(box);

		var wall1 = new FlxSprite(228+8, 16);
		wall1.makeGraphic(8, 16*3, FlxColor.YELLOW);
		wall1.immovable = true;
		wall1.allowCollisions = FlxObject.RIGHT;
		objects.add(wall1);


		var wall2 = new FlxSprite(228, 176);
		wall2.makeGraphic(8, 16*3, FlxColor.YELLOW);
		wall2.immovable = true;
		wall2.allowCollisions = FlxObject.LEFT;
		objects.add(wall2);
	}


}
