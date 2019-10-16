import flixel.FlxSprite;

class Spikes extends FlxSprite{
    public function new(X: Float, Y: Float, Orientation: String){
        super(X, Y);
        loadGraphic("assets/images/tileset.png", true, 16, 16);
        if(Orientation == "left"){
            width = 8;
            animation.frameIndex = 49;
            offset.set(0, 2);
            y+=2;
            height=12;
        }else if(Orientation == "right"){
            width = 8;
            x += 8;
            y+=2;
            offset.set(8, 2);
            height=12;

            animation.frameIndex = 50;
        }else if(Orientation == "top"){
            y+=1;
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