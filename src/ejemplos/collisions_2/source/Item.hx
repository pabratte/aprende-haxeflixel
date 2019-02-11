import flixel.FlxSprite;
import flixel.FlxG;
import flixel.util.FlxColor;


class Item extends FlxSprite{
    public function new(X: Float, Y: Float, Type: Int)
    {
        super(X, Y);
        type = Type;
        immovable = true;
        if(type == 1){
            makeGraphic(8, 8, FlxColor.GREEN);
        }else{
            makeGraphic(8, 8, FlxColor.YELLOW);
        }
    }

    public function getPoints(): Int{
        if(type == 1){
            return 100;
        }else{
            return 200;
        }
    }

    var type: Int;
}