import flixel.FlxSprite;

class Spikes extends FlxSprite{
    public function new(X: Float, Y: Float, Orientation: String){
        super(X, Y);
        loadGraphic("assets/images/tileset.png", true, 16, 16);
        if(Orientation == "left"){

        }else if(Orientation == "right"){

        }else if(Orientation == "top"){
            height = 8;
            animation.frameIndex = 51;
        }else{
            y += 8;
            height = 8;
            offset.y = 8;
            animation.frameIndex = 38;
        }
    }
}