import flixel.FlxSprite;

class Exit extends FlxSprite{
    var pressed: Bool = false;
    var id: Int;
    public function new(X: Float, Y: Float){
        super(X, Y);
        loadGraphic("assets/images/tileset.png", true, 16, 16);
        animation.frameIndex = 60;
        width = 10;
        height = 10;
        offset.set(3, 6);
        x += 3;
        y += 6;
    }
}