import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.group.FlxGroup;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;

class Door extends FlxSprite{
    static var doors: FlxTypedGroup<Door> = new FlxTypedGroup<Door>();
    var is_open: Bool = false;
    var door_id: Int;

    public function new(X: Float, Y: Float, Door_id: Int){
        super(X, Y, "assets/images/door.png");
        door_id = Door_id;
        is_open = false;
        doors.add(this);
        immovable = true;
    }

    public static function find_door_by_id(door_id){
        var door: Door = null;
        doors.forEach(function(d: Door){
            if(d.door_id == door_id){
                door = d;
            }
        });
        return door;
    }

    public function open(){
        FlxTween.tween(this, {y: y-32}, 0.2, {ease: FlxEase.backOut});
    }
}