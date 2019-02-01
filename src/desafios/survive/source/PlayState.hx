package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	var hero: FlxSprite;				// sprite del héroe
	var ghost: FlxSprite;				// sprite del enemigo
	var ghost_speed: Float = 150;		// velocidad del enemigo (aumenta con el tiempo)
	var total_time: Float = 0;			// tiempo transcurrido (puntaje)
	var score_text: FlxText;			// texto para mostrar el puntaje
	var game_over: Bool = false;		// bandera que indica si perdimos
	var time_to_next_level: Float = 0;	// tiempo para avanzar al nivel siguiente


	inline static inline var HERO_VEL: Float = 70;

	override public function create():Void
	{
		super.create();
		hero = new FlxSprite(98, 112, AssetPaths.monster_181__png);

		ghost = new FlxSprite(196, 112, AssetPaths.monster_107__png);
		ghost.velocity.set(-ghost_speed, ghost_speed);
		
		score_text = new FlxText(0, 8, FlxG.width);
		score_text.alignment = "center";
		score_text.size = 16;
		
		add(new FlxSprite(0, 0, AssetPaths.background__png));
		add(hero);
		add(ghost);
		add(score_text);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		if(!game_over){
			// actualizar héroe y enemigo
			move_hero();
			move_ghost();
		
			// actualizar tiempo y texto de puntaje
			total_time += elapsed;
			score_text.text = ""+Std.int(total_time);
		
			// si el héroe choca con el fantasma => game over
			if(FlxG.overlap(hero, ghost)){
				game_over = true;
				ghost.velocity.set(0, 0);
			}

			time_to_next_level += elapsed;
			if(time_to_next_level >= 5){
				advance_to_next_level();
				time_to_next_level = 0;
			}
		}
	}

	function move_hero(){
		// movimiento del héroe
		if(FlxG.keys.pressed.A){
			hero.velocity.x = -HERO_VEL;
		}else if(FlxG.keys.pressed.D){
			hero.velocity.x = HERO_VEL;
		}
		/// TODO: 	escribir/modificar el código necesario
		///			para que el héroe se mueva en todas las direcciones 

		// impedir que el héroe salga de la pantalla
		// por el lado izquierdo
		if(hero.x < 0){
			hero.x = 0;
			hero.velocity.x = 0;
		}

		// impedir que el héroe salga de la pantalla
		// por abajo
		if(hero.y > FlxG.height - hero.height){
			hero.y = FlxG.height - hero.height;
			hero.velocity.y = 0;
		}
		/// TODO: limit movement in all directions
	}

	function move_ghost(){
		// cambiar la dirección cuando toca el borde izquierdo
		if(ghost.x < 0){
			ghost.x = 0;
			ghost.velocity.x = -ghost.velocity.x;
		}

		// cambiar la dirección cuando toca el borde inferior
		if(ghost.y > FlxG.height - ghost.height){
			ghost.y = FlxG.height - ghost.height;
			ghost.velocity.y = -ghost.velocity.y;
		}

		/// TODO: cambiar la dirección al tocar los bordes restantes
	}


	function advance_to_next_level(){
		/// TODO: 	incrementar en un 10% las componentes x e y
		/// 		de la velocidad del fantasma
	}
}
