package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.tile.FlxBaseTilemap;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledTileLayer;
import flixel.addons.editors.tiled.TiledObjectLayer;
import flixel.addons.editors.tiled.TiledObject;
import flixel.FlxObject;


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
		
		spikes = new FlxGroup();
		var objectLayer = cast(tiledMap.getLayer("objects"), TiledObjectLayer);
        for(i in 0...objectLayer.objects.length){
        	loadObject(objectLayer.objects[i]);
        }

		
		add(level);
		add(spikes);
		add(char);

	}

	override public function update(elapsed: Float)
	{
		super.update(elapsed);
		if(FlxG.keys.justPressed.R){
			FlxG.resetState();
		}
		FlxG.collide(level, char);
		FlxG.overlap(char, spikes, onCharEnemies);
		if(!char.isOnScreen()){
			FlxG.resetState();
		}
	}

	function onCharEnemies(char: Character, obj: FlxObject){
		char.animateDeath();
	}
	
	override public function destroy()
	{
		char = null;
		super.destroy();
	}


	function loadObject(obj: TiledObject){
            var type = obj.type;
            if(type == "Spikes"){
                var orientation = obj.properties.get("orientation");
                var spike = new Spikes(obj.x, obj.y-16, orientation);
                spikes.add(spike);
            }else{
                trace("ERROR: no reconozco el tipo "+ obj.type);
            }
        }


	private var char: Character;	// el personaje
	private var level: FlxTilemap;	// el nivel
	private var spikes: FlxGroup;
}
