package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.group.FlxGroup;	//
import flixel.FlxG;

class PlayState extends FlxState
{
	override public function create():Void
	{
		super.create();
		wall_left 	= new FlxSprite(0, 16, AssetPaths.wall_v__png);
		wall_right 	= new FlxSprite(320-4, 16, AssetPaths.wall_v__png);
		wall_top 	= new FlxSprite(0, 0, AssetPaths.wall_h__png);
		wall_bottom = new FlxSprite(0, 240-16, AssetPaths.wall_h__png);
		pit1 		= new FlxSprite(80, 64, "assets/images/pit.png");
		pit2 		= new FlxSprite(208, 16, "assets/images/pit.png");

		hero = new Hero(32, 160);

		add(new FlxSprite(0, 0, AssetPaths.background__png));
		add(wall_left);
		add(wall_right);
		add(wall_top);
		add(wall_bottom);
		add(pit1);
		add(pit2);
		add(hero);

		//
		walls = new FlxGroup();
		walls.add(wall_left);
		walls.add(wall_right);
		walls.add(wall_top);
		walls.add(wall_bottom);
		walls.add(pit1);
		walls.add(pit2);

		wall_bottom.immovable = true;
		wall_top.immovable = true;
		wall_left.immovable = true;
		wall_right.immovable = true;
		pit1.immovable = true;
		pit2.immovable = true;
		//

        add(new Enemy(32, 32));

	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(walls, hero);
	}

	var wall_left: 		FlxSprite;
	var wall_right: 	FlxSprite;
	var wall_top: 		FlxSprite;
	var wall_bottom: 	FlxSprite;
	var pit1:			FlxSprite;
	var pit2:			FlxSprite;
	var door:			FlxSprite;
	var hero: 			Hero;

	var walls: FlxGroup;
}
