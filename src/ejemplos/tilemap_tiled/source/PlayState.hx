package;

import flixel.FlxState;
import flixel.FlxObject;
import flixel.tile.FlxBaseTilemap;
import flixel.tile.FlxTilemap;
import flixel.FlxG;
import flixel.addons.editors.tiled.TiledMap;
import flixel.addons.editors.tiled.TiledTileLayer;
import flixel.addons.editors.tiled.TiledObjectLayer;
import flixel.addons.editors.tiled.TiledObject;
import flixel.group.FlxGroup;
import flixel.FlxCamera;

class PlayState extends FlxState
{
	override public function create():Void
	{
		super.create();
		hero = new Hero(128, 64);
		var tiledMap: TiledMap;
		tiledMap = new TiledMap("assets/data/map.tmx");
		
		var solidLayer = cast(tiledMap.getLayer("solid"), TiledTileLayer);
		
		map = new FlxTilemap();
		map.loadMapFromArray(solidLayer.tileArray, tiledMap.width, tiledMap.height,"assets/images/tiles_alpha.png", tiledMap.tileWidth, tiledMap.tileHeight, FlxTilemapAutoTiling.OFF, 1);
		bgColor = 0xff363636;

		FlxG.camera.follow(hero, TOPDOWN);
		FlxG.camera.setScrollBoundsRect(0, 0, tiledMap.fullWidth, tiledMap.fullHeight, true);

		coins = new FlxGroup();
		enemies = new FlxGroup();
		heroCollideables = new FlxGroup();

		var objectLayer = cast(tiledMap.getLayer("entities"), TiledObjectLayer);
		for(i in 0...objectLayer.objects.length){
			loadObject(objectLayer.objects[i]);
		}

		heroCollideables.add(map);
		heroCollideables.add(enemies);
		heroCollideables.add(coins);

		add(map);
		add(coins);
		add(enemies);
		add(hero);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(map, enemies);
		FlxG.overlap(heroCollideables, hero, onHeroCollision);
	}

	function loadObject(obj: TiledObject){
		var type = obj.type;
		if(type == "Coin"){
			var points = obj.properties.get("points");
			var coin = new Coin(obj.x, obj.y-16);
			coins.add(coin);
		}else if(type == "Enemy"){
			var enemy = new Enemy(obj.x, obj.y-16);
			enemies.add(enemy);
		}else if(type == "Player"){
			hero.x = obj.x;
			hero.y = obj.y-16;
		}else{
			trace("ERROR: no reconozco el tipo "+ obj.type);
		}
	}

	function onHeroCollision(object: FlxObject, hero: Hero){
		if(Type.getClass(object) == Enemy){
			hero.hit();
		}else if(Type.getClass(object) == Coin){
			var coin = cast(object, Coin);
			coin.pick();
		}else if(Type.getClass(object) == FlxTilemap){
			FlxObject.separate(object, hero);
		}
	}


	var map: FlxTilemap;
	var hero: Hero;
	var coins: FlxGroup;
	var enemies: FlxGroup;
	var heroCollideables: FlxGroup;
}
