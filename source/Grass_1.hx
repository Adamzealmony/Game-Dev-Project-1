package;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.FlxObject;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.math.FlxPoint; 
import flixel.util.FlxTimer;
import flixel.math.FlxRandom;

class Grass_1 extends FlxSprite
{

	var _t:FlxTimer;
	
	
	public function new(?X:Float=0, ?Y:Float=0)
	{
		super(X, Y);
		_t = new FlxTimer();
		_t.start();
		_t.time = FlxG.random.float(10,50);
		loadGraphic("assets/tiled/grass_ht_1_s_sprite.png", true, 100, 100);
	}
	override public function update(elapsed:Float):Void{
	if (_t.timeLeft <= .1)
	{
		PlayState.g1Grow = this;
		PlayState.grow1 = true;
		PlayState_2.g1Grow = this;
		PlayState_2.grow1 = true;
	}
	}
}