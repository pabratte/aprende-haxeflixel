package;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxSpriteUtil;

class Spaceship extends FlxSprite
{
	public function new(X: Float, Y: Float) {
		super(X, Y);
        loadGraphic(AssetPaths.space_ship__png, true, 15, 29);
        animation.add("spaceship-thrust", [0, 1], 4);
        animation.play("spaceship-thrust");
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
        update_movement();
        check_bounds();
	}


    private function update_movement(){
        if(FlxG.keys.pressed.A){
			velocity.x = -SPACESHIP_VEL;
		}else if(FlxG.keys.pressed.D){
			velocity.x = SPACESHIP_VEL;
		}else{
			velocity.x = 0;
		}

        if(FlxG.keys.pressed.W){
			velocity.y = -SPACESHIP_VEL;
		}else if(FlxG.keys.pressed.S){
			velocity.y = SPACESHIP_VEL;
		}else{
			velocity.y = 0;
		}
    }

    private function check_bounds(){
        if(x<0){
            x = 0;
            velocity.x = 0;
        }else if(x>FlxG.width-width){
            x = FlxG.width-width;
            velocity.x = 0;
        }

        if(y<0){
            y = 0;
            velocity.y = 0;
        }else if(y>FlxG.height-height){
            y = FlxG.height-height;
        }
    }

    public function get_shields_energy(): Int{
        return shields_enegy;
    }

    public function take_hit(){
        if(!FlxSpriteUtil.isFlickering(this)){
            if(shields_enegy > 0){
                shields_enegy = shields_enegy - 1;
                FlxSpriteUtil.flicker(this);
            }else{
                kill();
            }
        }
        
    }

    public function pickup_shield_item(){
        shields_enegy = shields_enegy + 1;
        if(shields_enegy > 5){
            shields_enegy = 5;
        }
    }

    private var shields_enegy: Int = 5;
    private static inline var SPACESHIP_VEL: Float = 100;
}
