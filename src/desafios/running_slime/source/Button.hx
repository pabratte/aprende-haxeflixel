import flixel.FlxSprite;
import flixel.FlxObject;

class Button extends FlxSprite{
    var pressed: Bool = false;
    var id: Int;
    public function new(X: Float, Y: Float, Id: Int){
        super(X, Y);
        id = Id;
        loadGraphic("assets/images/tileset.png", true, 16, 16);
        animation.frameIndex = 61;
        pressed = false;
        y += 12;
        height = 4;
        offset.y = 11;
        allowCollisions = FlxObject.CEILING;
        immovable = true;
    }

    public override function update(elapsed: Float){
        super.update(elapsed);
        // if button collided from above, press it
        if(wasTouching & FlxObject.CEILING != 0){
            press();
        }
    }

    public function press(){
        animation.frameIndex = 62;
        pressed = true;
        allowCollisions = FlxObject.NONE;
        var door = Door.find_door_by_id(id);
        if(door != null){
            door.open();
        }else{
            trace("Door not found");
        }
    }
}