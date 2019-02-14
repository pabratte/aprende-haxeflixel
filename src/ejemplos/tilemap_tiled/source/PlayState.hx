import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxObject;
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
		bgColor = 0xff849684;
		level = new TiledLevel("assets/data/levels/level01.tmx");
		
		// create groups
		enemies = new FlxTypedGroup<Enemy>();
		coins = new FlxTypedGroup<Coin>();
		heroCollideables = new FlxGroup();
		levelCollideables = new FlxGroup();
		
		// load objects
		level.loadObjects(loadObjectCallback);
		
		levelCollideables.add(hero);
		levelCollideables.add(enemies);
		heroCollideables.add(enemies);
		heroCollideables.add(coins);

		add(level.foregroundTiles);
		add(coins);
		add(enemies);
		add(hero);
	}

	function loadObjectCallback(type: String, x: Int, y: Int){
		switch (type){
			case "player_start":
				hero = new Hero(x, y);
			case "enemy":
				var enemy = new Enemy(x, y);
				enemies.add(enemy);
			case "coin":
				coins.add(new Coin(x, y));
			default:
				trace("Unknow object type: "+type);
		}
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		level.collideWithLevel(levelCollideables);
		
		FlxG.overlap(heroCollideables, hero, onCollisionWithChar);
		//FlxG.collide(level.foregroundTiles, enemies);
		if(FlxG.keys.justPressed.R)
		{
			FlxG.resetState();
		}
	}

	private function onCollisionWithChar(theObject: FlxObject, hero: Hero)
	{
		if(Type.getClass(theObject) == Enemy)
		{
			hero.hit();
		}else if(Type.getClass(theObject) == Coin){
			var theCoin = cast(theObject, Coin);
			theCoin.pick();
		}
	}

	private var hero: Hero;
	private var level: TiledLevel;
	private var enemies: FlxTypedGroup<Enemy>;
	private var coins: FlxTypedGroup<Coin>;
	private var heroCollideables: FlxGroup;			// things that can collide with the Hero
	private var levelCollideables: FlxGroup;		// things that can collide with the level
	

}
