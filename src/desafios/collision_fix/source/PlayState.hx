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

		add(new Exit(32, 192));
				
		/// TODO: crear y agregar los grupos que sean necesarios

        add(new Enemy(32, 32));
        add(new Enemy(144, 32));
        add(new Enemy(160, 192));
        add(new Enemy(272, 192));
        add(new Enemy(272, 32));
		
		add(new Flask(32, 112));
		add(new Flask(144, 112, 1));
		add(new Flask(272, 112, 2));
		
		add(hero);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		/// TODO: detectar las colisiones entre los elementos
	}

	/// TODO: crear las funciones callback necesarias para el manejo de colisiones

	var wall_left: 		FlxSprite;
	var wall_right: 	FlxSprite;
	var wall_top: 		FlxSprite;
	var wall_bottom: 	FlxSprite;
	var pit1:			FlxSprite;
	var pit2:			FlxSprite;
	var door:			FlxSprite;
	var hero: 			Hero;
}
