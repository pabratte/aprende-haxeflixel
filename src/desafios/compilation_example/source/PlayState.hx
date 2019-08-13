package;

import flixel.FlxState;
import flixel.FlxG;
import flixel.text.FlxText;

class PlayState extends FlxState
{
	override public function create():Void
	{
		super.create();
		var name: String = "Pablo";
		m_text = new FlxText(0, 100, 640);
		m_text.text = "Hola HaxeFlixel!!!\nMi nombre es\n" + name;
		m_text.alignment = "center";
		m_text.size = 60;
		add(m_text);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		m_text.color = FlxG.random.color();
		m_text.angle = FlxG.random.float(-5, 5);
		m_text.scale.x = m_text.scale.y = FlxG.random.float(0.7, 1);
	}

	private var m_text: FlxText;
}
