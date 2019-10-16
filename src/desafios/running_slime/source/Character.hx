package;

import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.FlxG;

class Character extends FlxSprite
{	
	public static inline var JUMP_VEL = 300;
	public static inline var MOV_VEL = 150;
	public static inline var GRAVITY = 800;

	var nJumps: Int = 0;

	public function new(X: Float, Y: Float)
	{
		super(X, Y);
		loadGraphic("assets/images/enemies-spritesheet.png", true, 20, 20);
		animation.add("idle", [10, 11], 6, true);
		animation.play("idle");
		
		width = 16;
		offset.x = 2;
		height = 10;
		offset.y = 10;
		y += 4;

		// TODO: el personaje debe tener velocidad hacia la derecha y gravedad
	}


	public override function update(elapsed: Float)
	{	
		super.update(elapsed);
		// TODO: el personaje debe invertir su velocidad horizontal al chocar con la pared

		// TODO: el personaje puede saltar utilizando la tecla W si se encuentra tocando el suelo
		
		// TODO: el personaje puede efectuar un salto doble si se encuentra en la parte más alta de un salto
	}

	public function animateDeath(){
		allowCollisions = FlxObject.NONE;
		velocity.y = -JUMP_VEL;
		velocity.x = velocity.x/5;
		angularVelocity = 200;
	}
}
