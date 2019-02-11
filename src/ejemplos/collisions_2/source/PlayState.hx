package;

import flixel.FlxState;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.group.FlxGroup;
import flixel.util.FlxColor;
import flixel.FlxG;

class PlayState extends FlxState
{
	var hero: Hero;
	var items: FlxGroup;
	var walls: FlxGroup;
	var heroCollideables: FlxGroup;
	var points: Int = 0;
	var pointsText: FlxText;
	
	override public function create():Void
	{
		super.create();
		hero = new Hero(100, 100);
		items = new FlxGroup();
		walls = new FlxGroup();

		add(hero);
		add(walls);
		add(items);
		create_walls();
		create_items();

		heroCollideables = new FlxGroup();
		heroCollideables.add(walls);
		heroCollideables.add(items);
		pointsText = new FlxText(16, 0, 200);
		add(pointsText);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.overlap(hero, heroCollideables, onHeroCollide);
		pointsText.text = "PUNTOS: "+points;
	}

	function onHeroCollide(hero: Hero, object: FlxObject){
		if(Type.getClass(object) == Wall){
			FlxObject.separate(hero, object);
		}else if(Type.getClass(object) == Item){
			var item: Item = cast(object, Item);
			points = points + item.getPoints();
			item.kill();
		}
	}

	function create_walls(){
		walls.add(new Wall(16, 0, FlxG.width-32, 16));
		walls.add(new Wall(16, FlxG.height-16, FlxG.width-32, 16));
		walls.add(new Wall(0, 16, 16, FlxG.height-32));
		walls.add(new Wall(FlxG.width-16, 16, 16, FlxG.height-32));
	}

	function create_items(){
		for(i in 0...11){
			items.add(new Item(36+24*i, 36, 1));
		}
		for(i in 0...11){
			items.add(new Item(36+24*i, FlxG.height-40, 2));
		}
	}
}
