package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.tile.FlxBaseTilemap;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledTileLayer;


class PlayState extends FlxState
{
	override public function create():Void
	{
		super.create();
		char = new Character(160, 50);
		level = new FlxTilemap();
		
		var tiledMap = new TiledMap("assets/data/level0.tmx");
		var layer = cast(tiledMap.getLayer("solid"), TiledTileLayer);
		level.loadMapFromArray(layer.tileArray, layer.width, layer.height, "assets/images/tileset.png", 16, 16, FlxTilemapAutoTiling.OFF, 1);
		
		add(level);
		add(char);
	}

	override public function update(elapsed: Float)
	{
		super.update(elapsed);
		if(FlxG.keys.justPressed.R){
			FlxG.resetState();
		}
		FlxG.collide(level, char);
	}

	override public function destroy()
	{
		char = null;
		super.destroy();
	}

	private var char: Character;	// el personaje
	private var level: FlxTilemap;	// el nivel
}
