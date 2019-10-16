import flixel.FlxSprite;

class Coin extends FlxSprite{
    public function new(X: Float, Y: Float){
        super(X, Y);
        loadGraphic("assets/images/tileset.png", true, 16, 16);
        animation.frameIndex = 63;
        width=height=8;
        offset.set(4, 4);
        x+=4;
        y+=4;
    }
}