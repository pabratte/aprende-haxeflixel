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
		trace("Loading assets/data/level"+Global.levelNum+".tmx");
		level = new FlxTilemap();
		
		var tiledMap = new TiledMap("assets/data/level"+Global.levelNum+".tmx");
		var layer = cast(tiledMap.getLayer("solid"), TiledTileLayer);
		level.loadMapFromArray(layer.tileArray, layer.width, layer.height, "assets/images/tileset.png", 16, 16, FlxTilemapAutoTiling.OFF, 1);
		
		var background = new FlxTilemap();
		var backgroundLayer = cast(tiledMap.getLayer("background"), TiledTileLayer);
		background.loadMapFromArray(backgroundLayer.tileArray, layer.width, layer.height, "assets/images/tileset.png", 16, 16, FlxTilemapAutoTiling.OFF, 1);

		var props = new FlxTilemap();
		var propsLayer = cast(tiledMap.getLayer("props"), TiledTileLayer);
		props.loadMapFromArray(propsLayer.tileArray, layer.width, layer.height, "assets/images/tileset.png", 16, 16, FlxTilemapAutoTiling.OFF, 1);

		// TODO: configurar los tiles para que sean one-sided platforms

		// create groups
		spikes = new FlxGroup();
		coins = new FlxGroup();
		buttons = new FlxGroup();
		doors = new FlxGroup();
		characterCollideables = new FlxGroup();
		characterCollideables.add(level);
		characterCollideables.add(spikes);
		characterCollideables.add(doors);
		characterCollideables.add(coins);
		characterCollideables.add(buttons);

		// load objects
		var objectLayer = cast(tiledMap.getLayer("objects"), TiledObjectLayer);
        for(i in 0...objectLayer.objects.length){
        	loadObject(objectLayer.objects[i]);
        }

		// scrolling
		FlxG.camera.follow(char);
		FlxG.camera.setScrollBoundsRect(0, 0, tiledMap.fullWidth, tiledMap.fullHeight, true);

		// add objects to scene
		add(background);
		add(doors);
		add(level);
		add(spikes);
		add(char);
		add(props);
		add(coins);
		add(buttons);
	}



	override public function update(elapsed: Float)
	{
		super.update(elapsed);
		if(FlxG.keys.justPressed.R){
			FlxG.resetState();
		}

		// TODO: manejar colisiones:
		// * El personaje muere si toca las espinas
		// * El personaje puede juntar los items (Coins)
		// * El personaje debe colisionar contra el escenario,
		//   las puertas (Doors, no la puerta de salida) y los botones.
		//	 En el caso de los botones, el comportamiento es manejado por la clase Button,
		//   el personaje debe simplemente chocar con ellos
		// * Se debe pasar de nivel (nextLevel()) si el personaje toca la salida
		
		// after the dead animation, restart when character falls from the screen
		if(char.y > FlxG.camera.maxScrollY){
			FlxG.resetState();
		}
		
	}


	function nextLevel(){
		Global.levelNum = ((Global.levelNum + 1) % 3);
		char.allowCollisions = FlxObject.NONE;
		FlxG.resetState();
	}



	function loadObject(obj: TiledObject){
            var type = obj.type;
            if(type == "Spikes"){
                var orientation = obj.properties.get("orientation");
                var spike = new Spikes(obj.x, obj.y-16, orientation);
                spikes.add(spike);
			}else if(type == "Player"){
				char = new Character(obj.x, obj.y-16);
			}else if(type == "Coin"){
				coins.add(new Coin(obj.x, obj.y-16));
			}else if(type == "Button"){
				var button_id = Std.parseInt(obj.properties.get("button_id")); 
				buttons.add(new Button(obj.x, obj.y-16, button_id));
			}else if(type == "Door"){
				var door_id = Std.parseInt(obj.properties.get("door_id")); 
				doors.add(new Door(obj.x, obj.y, door_id));
			}else if(type == "Exit"){
				buttons.add(new Exit(obj.x, obj.y-16));
			}else{
                trace("ERROR: no reconozco el tipo "+ obj.type);
            }
        }


	private var char: Character;
	private var level: FlxTilemap;
	private var spikes: FlxGroup;
	private var coins: FlxGroup;
	private var buttons: FlxGroup;
	private var doors: FlxGroup;
	private var characterCollideables: FlxGroup;
}
