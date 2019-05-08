package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.group.FlxGroup;
import flixel.text.FlxText;
import flixel.FlxG;
import flixel.util.FlxTimer;

class PlayState extends FlxState
{
	override public function create():Void
	{
		super.create();
		spaceship = new Spaceship(92, 280);
		asteroids = new FlxGroup();
		for(i in 1...15){
			asteroids.add(new Asteroid());
		}
		add(new FlxSprite(0, 0, AssetPaths.starbasesnow__png));
		powerup = new FlxSprite(0, -50, AssetPaths.powerup__png);

		add(asteroids);
		add(powerup);
		add(spaceship);
		
		energy_indicator = new FlxText(0, 0, FlxG.width);
		add(energy_indicator);
		var t = new FlxTimer();
		t.start(20, createPowerup);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		update_energy_indicator();
		FlxG.overlap(spaceship, asteroids, onSpaceshipOverlapAsteroids);
		FlxG.overlap(spaceship, powerup, onSpaceshipOverlapPowerup);
	}

	private function onSpaceshipOverlapAsteroids(s: Spaceship, a: Asteroid){
		s.take_hit();
	}

	private function createPowerup(t: FlxTimer){
		powerup.reset(0, 0);
		powerup.x =  FlxG.random.int(0, Std.int(FlxG.width-powerup.width));
		powerup.y = -powerup.height;
		powerup.velocity.y = 50;
		t.reset(20);
	}

	private function onSpaceshipOverlapPowerup(s: Spaceship, p: FlxSprite){
		p.kill();
		s.pickup_shield_item();
	}

	private function update_energy_indicator(){
		energy_indicator.text = "SHIELDS [";
		for(i in 0...spaceship.get_shields_energy()){
			energy_indicator.text = energy_indicator.text + "||";
		}
		for(i in spaceship.get_shields_energy()...5){
			energy_indicator.text = energy_indicator.text + "  ";
		}
		energy_indicator.text = energy_indicator.text + "]";
	}

	var spaceship: Spaceship;
	var powerup: FlxSprite;
	var asteroids: FlxGroup;
	var energy_indicator: FlxText;
}
