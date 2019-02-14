package;

import flixel.FlxState;
import flixel.tile.FlxBaseTilemap;
import flixel.tile.FlxTilemap;
import flixel.FlxG;

class PlayState extends FlxState
{
	override public function create():Void
	{
		super.create();
		hero = new Hero(128, 64);
		map = new FlxTilemap();
		map.loadMapFromCSV(mapData, AssetPaths.tileTest2__png, 32, 32, FlxTilemapAutoTiling.OFF, 1);
		bgColor = 0xff363636;
		add(map);
		add(hero);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(map, hero);
	}

	var map: FlxTilemap;
	var hero: Hero;
	var mapData: String = 
	"2,12, 1, 1, 1, 1, 1, 1,12, 2,
	12, 0, 0, 0, 0, 0, 0, 0, 0,12,
	 1, 0, 0, 0, 0, 0, 0, 0, 0, 1,
	 1, 0, 2,11,11,11,11, 2, 0, 1,
	 1, 0, 0, 0, 0, 0, 0, 0, 0, 1,
	12, 0, 0, 0, 0, 0, 0, 0, 0,12,
	 2,12, 1, 1, 1, 1, 1, 1,12, 2
	";
}
