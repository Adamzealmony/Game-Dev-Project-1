package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxObject;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.math.FlxPoint; 
import flixel.util.FlxTimer;
import flixel.math.FlxRandom;

class Grass_2 extends FlxSprite
{

	var _t:FlxTimer;
	
	public function new(?X:Float=0, ?Y:Float=0)
	{
		super(X, Y);
		_t = new FlxTimer();
		_t.start();
		_t.time = FlxG.random.float(5,20);
		loadGraphic("assets/tiled/grass_ht_2_s_sprite.png", true, 100, 100);
	}
	override public function update(elapsed:Float):Void{
	if (_t.timeLeft <= .1)
	{
		PlayState.g2Grow = this;
		PlayState.grow2 = true;
	}
	}
}