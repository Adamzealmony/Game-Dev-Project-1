package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxObject;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.math.FlxPoint; 
import flixel.util.FlxTimer;

class Grass_1 extends FlxSprite
{

	var _timer:FlxTimer;
	
	public function new(?X:Float=0, ?Y:Float=0)
	{
		super(X, Y);
		_timer.time = FlxG.random.int(5, 10);
		loadGraphic("assets/tiled/grass_ht_1_s_sprite.png", true, 100, 100);
	}
	override public function update(elapsed:Float):Void{
	if (_timer.timeLeft <= .1)
	{
		PlayState.spawn_Grass2(this);
	}
	}
}